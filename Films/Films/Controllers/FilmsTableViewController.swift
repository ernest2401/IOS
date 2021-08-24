import UIKit

class FilmsTableViewController: UITableViewController {
    
    let networkFilmsManager = NetworkFilmsManager()
    
    var films: [String] = []
    var descriptions: [String] = []
    var images: [String] = []
    var votes: [Double] = []
    
    var currentFilm : CurrentFilm? = nil
    
    //var networkFilmsManager = NetworkFilmsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Топ популярных фильмов"
        //networkFilmsManager.fetchPopularFilms()
        
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=fe6fae94830eb609a377b3b354612720&language=ru"
        networkFilmsManager.request(urlString: urlString) { currentFilm, error in
            //            currentFilm?.results.map({ (film) in
            //                print(film.title)
            //            })
            self.currentFilm = currentFilm
            for i in 0...((currentFilm?.results.count)! - 1) {
                print(currentFilm!.results[i].title)
                self.films.append(currentFilm!.results[i].title)
                self.descriptions.append(currentFilm!.results[i].overview)
                self.images.append(currentFilm!.results[i].backdrop_path)
                self.votes.append(currentFilm!.results[i].vote_average)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //print(self.objects)
            //print(self.objects.count)
        }
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return objects.count
        return films.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmsCell", for: indexPath) as! FilmsTableViewCell
        cell.nameLabel.text = films[indexPath.row]
        let imageMain = "https://www.themoviedb.org/t/p/w1280/" + images[indexPath.row]
        cell.imageLabel.image = UIImage(data: try! Data(contentsOf: URL(string: imageMain)!))
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: films[indexPath.row ], message: "Хотите просмотреть информацию о фильме?", preferredStyle: .actionSheet)
        let filmAction = UIAlertAction(title: "Посмотреть", style: .default) { (alert) in
            self.performSegue(withIdentifier: "goToDescription", sender: indexPath)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alert.addAction(filmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "goToDescription"{
            print("Сработало")
            let vc = segue.destination as! DescriptionViewController
            let indexPath = sender as! IndexPath
            
            vc.name =  self.films[indexPath.row]
            vc.overview = self.descriptions[indexPath.row]
            vc.image = self.images[indexPath.row]
            vc.vote = self.votes[indexPath.row]
            print(films[indexPath.row])
            print(vc.name)
        }
    }
}

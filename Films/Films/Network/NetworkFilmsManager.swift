import Foundation

struct NetworkFilmsManager{
    var objects: [String] = []
    
    func request(urlString: String, completion: @escaping (CurrentFilm?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            //DispatchQueue.main.async {
            if let error = error{
                print("Some error")
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            do {
                let films = try JSONDecoder().decode(CurrentFilm.self, from: data)
//                print(films.results.map({ (title) in
//                    title.title
//                }))
                completion(films,nil)
            } catch let jsonError {
                print("Failed to decode JSON",jsonError)
                completion(nil,jsonError)
            }
            
            
        }.resume()
    }
}

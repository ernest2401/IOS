import UIKit

class DescriptionViewController: UIViewController {
    
    var name: String = ""
    var overview: String = ""
    var image: String = ""
    var vote: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image = "https://www.themoviedb.org/t/p/w1280/" + image
        nameLabel.text = name
        descriptionLabel.text = "Описание: \(overview)"
        imageLabel.image = UIImage(data: try! Data(contentsOf: URL(string: image)!))
        voteLabel.text = "Рейтинг: \(String(vote))"
    }
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var voteLabel: UILabel!
    
}

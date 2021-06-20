import Foundation

struct CurrentFilm: Decodable {
    var page : Int
    var results : [Film]
}

struct Film: Decodable {
    var title : String
    var overview: String
    var backdrop_path: String
    var vote_average: Double
}

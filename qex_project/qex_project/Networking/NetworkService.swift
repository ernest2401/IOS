//
//  NetworkService.swift
//  twitch
//
//  Created by Ernest Migranov on 03.09.2021.
//

import Foundation

class NetworkService{
    func request(urlString: String, completion:@escaping (SearchResponse?,Error?) -> Void){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(nil,error )
                    return
                }
                guard let data = data else { return }
//                let someString = String(data: data,encoding: .utf8)
//                print(someString)
                do{
                    let ads = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(ads,nil)
                }
                catch let jsonError{
                    print("Failed to decode JSON",jsonError)
                    completion(nil,jsonError)
                }
            }
        }.resume()
    }
    
}

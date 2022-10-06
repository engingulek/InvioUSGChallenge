//
//  APICaller.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 6.10.2022.
//

import Foundation

import Alamofire
struct Constanst {
    static let baseUrl = "http://www.omdbapi.com/?"
    static let apiKey =  "4ad7f607"
}

class APICaller {
    static let shared = APICaller()
    func getSearchMovie(searchText:String,completion: @escaping (Result<[Movie],Error>)->Void) {
        AF.request("\(Constanst.baseUrl)s=\(searchText)&apikey=\(Constanst.apiKey)",method: .get).response{ response in
            if let data = response.data {
                do{
                    
                    let result = try JSONDecoder().decode(MovieResult.self, from: data)
                    if result.Response == "True" {
                        if let movies = result.Search {
                            completion(.success(movies))
                        }
                    }else{
                        let nullMovie = [Movie]()
                        completion(.success(nullMovie))
                    }
                }catch{
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
}

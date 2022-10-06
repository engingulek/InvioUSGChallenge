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

class APICaller : SearchWebServiceProtocol  {
    static let shared = APICaller()
    func getSearchMovie(searchText:String,completion: @escaping (Result<MovieResult,Error>)->Void) {
        AF.request("\(Constanst.baseUrl)s=\(searchText)&apikey=\(Constanst.apiKey)",method: .get).response{ response in
            if let data = response.data {
                do{
                    
                    let result = try JSONDecoder().decode(MovieResult.self, from: data)
                    if result.Response == "True" {
                      
                            completion(.success(result))
                        
                    }else{
                        
                        completion(.success(result))
                    }
                }catch{
                    completion(.failure(error))
                    
                }
            }
        }
    }
}

extension APICaller {
    func getMovieDetail(movieImdbId:String,completion: @escaping(Result<MovieDetail,Error>)->Void){
        AF.request("\(Constanst.baseUrl)i=\(movieImdbId)&apikey=\(Constanst.apiKey)&plot=full",method: .get).response{ response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(MovieDetail.self, from: data)
                    
                    if result.Response == "True" {
                        let movie = MovieDetail( Poster: result.Poster!,
                                               Title: result.Title!,
                                                Director: result.Director!,
                                                Genre: result.Genre!,
                                                Runtime: result.Runtime!,
                                                Writer: result.Writer!,
                                                Language: result.Language!,
                                                 Country: result.Country!,
                                                Plot: result.Plot!,
                                                 imdbRating: result.imdbRating!,
                                                Response: result.Response!)
                        
                        completion(.success(movie))
                    }
                }catch{
                    completion(.failure(error))
                    
                }
            }
        }
    }
}

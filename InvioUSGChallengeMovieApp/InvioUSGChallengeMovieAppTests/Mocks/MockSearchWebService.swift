//
//  MockSearchWebService.swift
//  InvioUSGChallengeMovieAppTests
//
//  Created by engin gülek on 6.10.2022.
//

import Foundation
import Alamofire
@testable import InvioUSGChallengeMovieApp
class MockSearchWebService : SearchWebServiceProtocol {
    var isSearchMovieMethod : Bool = false
    func getSearchMovie(searchText: String, completion: @escaping (Result<MovieResult, Error>) -> Void) {
        isSearchMovieMethod = true
        AF.request("\(Constanst.baseUrl)s=\(searchText)&apikey=\(Constanst.apiKey)",method: .get).response{ response in
            if let data = response.data {
                do{
                    
                    let result = try JSONDecoder().decode(MovieResult.self, from: data)
                    let moviewResult = MovieResult(Search: result.Search, Response: result.Response)
                    completion(.success(moviewResult))
                }catch{
                    completion(.failure(error))
                    
                }
            }
        }
        
        
        
    }
    
    
}

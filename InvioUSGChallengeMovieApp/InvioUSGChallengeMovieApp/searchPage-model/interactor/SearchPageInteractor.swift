//
//  SearchPageInteractor.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation
import Alamofire
class SearchPageInteractor : PresenterToInteractorSearchPageProtocol {
    var searhPagePresenter: InteractorToPresenterSearchPageProtocl?
    
    func getMovie(searchText: String) {
        AF.request("http://www.omdbapi.com/?s=\(searchText)&apikey=4ad7f607",method: .get).response{ response in
            if let data = response.data {
                do{
                    
                    let result = try JSONDecoder().decode(MovieResult.self, from: data)
                    
                    
                    if let movies = result.Search {
                        print(movies)
                        self.searhPagePresenter?.toPresenter(movieList: movies)
                    }
                
                    
                }catch{
                    
                }
            }
            
        }
        
    }
}

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
        APICaller.shared.getSearchMovie(searchText: searchText) { result in
            switch result {
            case .success(let response):
                if response.Response == "True" {
                    self.searhPagePresenter?.toPresenter(movieList: response.Search!)
                }else{
                    let nullMovie = [Movie]()
                    self.searhPagePresenter?.toPresenter(movieList: nullMovie)
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}

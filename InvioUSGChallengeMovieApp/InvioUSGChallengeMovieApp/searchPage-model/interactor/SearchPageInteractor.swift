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
            case .success(let movies):
                self.searhPagePresenter?.toPresenter(movieList: movies)
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}

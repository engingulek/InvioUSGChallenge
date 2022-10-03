//
//  SearchPageInteractor.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation
class SearchPageInteractor : PresenterToInteractorSearchPageProtocol {
    var searhPagePresenter: InteractorToPresenterSearchPageProtocl?
    
    func getMovie() {
        self.searhPagePresenter?.toPresenter(movieList: "gelen data")
    }
    
    
}

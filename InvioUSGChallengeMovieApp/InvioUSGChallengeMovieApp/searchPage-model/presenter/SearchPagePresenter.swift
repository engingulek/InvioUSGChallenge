//
//  HomePagePresenter.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation


class SearchPagePresenter : ViewtoPresenterSearchPageProtocol {
    func getMovieAction() {
        interactor?.getMovie()
        print("oldu 2")
    }
    
    var interactor: PresenterToInteractorSearchPageProtocol?
    
    var searchPageView: PresenterToViewSearchPageProtocol?
    
   
}


extension SearchPagePresenter : InteractorToPresenterSearchPageProtocl {
    func toPresenter(movieList: String) {
        searchPageView?.toView(movieList: movieList)
    }
    
    
}

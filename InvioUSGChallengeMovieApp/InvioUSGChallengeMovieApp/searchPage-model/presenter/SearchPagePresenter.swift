//
//  HomePagePresenter.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation


class HomePagePresenter : ViewtoPresenterSearchPageProtocol {
    func getMovieAction() {
        interactor?.getMovie()
    }
    
    var interactor: PresenterToInteractorSearchPageProtocol?
    
    var searchPageView: PresenterToViewSearchPageProtocol?
    
   
}


extension HomePagePresenter : InteractorToPresenterSearchPageProtocl {
    func toPresenter(movieList: String) {
        searchPageView?.toView(movieList: movieList)
    }
    
    
}

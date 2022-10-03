//
//  HomePagePresenter.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation


class SearchPagePresenter : ViewtoPresenterSearchPageProtocol {
    func getMovieAction(searchText: String) {
        interactor?.getMovie(searchText: searchText)
    }
    
    
    
    var interactor: PresenterToInteractorSearchPageProtocol?
    
    var searchPageView: PresenterToViewSearchPageProtocol?
    
   
}


extension SearchPagePresenter : InteractorToPresenterSearchPageProtocl {
    func toPresenter(movieList: Array<Movie>) {
        print("Presenter \(movieList)")
        searchPageView?.toView(movieList: movieList)
    }
    
   
    
}

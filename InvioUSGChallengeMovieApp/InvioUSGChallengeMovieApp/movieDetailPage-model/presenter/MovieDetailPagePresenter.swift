//
//  MovieDetailPagePresenter.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation


class MovieDetailPagePresenter : ViewToPresenterMovieDetailPageProtocol {
    var movieDetailPageView: PresenterToViewMovieDetailPageProtocol?
    
    var interactor: PresenterToInteractorMovieDetailPageProtocol?
    
  
    
    func getMovieDetailAction(movieImdbId: String) {
        interactor?.getMovieDetail(movieImdbId: movieImdbId)
    }
    
    
}

extension MovieDetailPagePresenter : InteractorToPresenterMovieDetailPageProtocol {
    func toPresenter(movieDetail: MovieDetail) {
        movieDetailPageView?.toView(movieDetail: movieDetail)
    }
    
    
}

//
//  MovieDetailPageRouter.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation


class MovieDetailPageRouter : PresenterToRouterMovieDetailPageProtocol {
    static func createModel(ref: MovieDetailPageViewController) {
        let presenter = MovieDetailPagePresenter()
        ref.movieDetailPageObject = presenter
        ref.movieDetailPageObject?.interactor = MovieDetailPageInteractor()
        ref.movieDetailPageObject?.interactor?.movieDetailPagePresenter = presenter
        ref.movieDetailPageObject?.movieDetailPageView = ref
       
 
    }
    
    
}

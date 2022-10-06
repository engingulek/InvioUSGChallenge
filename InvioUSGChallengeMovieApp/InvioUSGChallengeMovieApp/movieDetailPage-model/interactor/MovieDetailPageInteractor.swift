//
//  MovieDetailPageInteractor.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation
class MovieDetailPageInteractor : PresenterToInteractorMovieDetailPageProtocol {
    var movieDetailPagePresenter: InteractorToPresenterMovieDetailPageProtocol?
    
    func getMovieDetail(movieImdbId: String) {
        APICaller.shared.getMovieDetail(movieImdbId: movieImdbId) { result in
            switch result {
            case .success(let movie):
                self.movieDetailPagePresenter?.toPresenter(movieDetail: movie)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
}
}

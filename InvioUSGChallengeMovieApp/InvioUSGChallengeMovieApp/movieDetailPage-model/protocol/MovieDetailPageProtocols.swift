//
//  MovieDetailPageProtocol.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation


protocol ViewToPresenterMovieDetailPageProtocol {
    var interactor : PresenterToInteractorMovieDetailPageProtocol? {get set}
    var movieDetailPageView : PresenterToViewMovieDetailPageProtocol? {get set}
    func getMovieDetailAction(movieImdbId:String)
    
}


protocol PresenterToInteractorMovieDetailPageProtocol {
    var movieDetailPagePresenter : InteractorToPresenterMovieDetailPageProtocol? {get set}
    func getMovieDetail(movieImdbId:String)
    
}

protocol InteractorToPresenterMovieDetailPageProtocol {
    func toPresenter(movieDetail:MovieDetail)
    
}

protocol PresenterToViewMovieDetailPageProtocol {
    func toView(movieDetail:MovieDetail)
    
}

protocol PresenterToRouterMovieDetailPageProtocol {
    static func createModel(ref:MovieDetailPageViewController)
    
}


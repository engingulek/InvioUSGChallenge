//
//  HomePageProtocols.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation

protocol ViewtoPresenterSearchPageProtocol {
    var interactor : PresenterToInteractorSearchPageProtocol? {get set}
    var searchPageView : PresenterToViewSearchPageProtocol? {get set}
    func getMovieAction()
}


protocol PresenterToInteractorSearchPageProtocol {
    var searhPagePresenter : InteractorToPresenterSearchPageProtocl? {get set}
    func getMovie()
    
}

protocol InteractorToPresenterSearchPageProtocl {
    func toPresenter (movieList:String)
}
protocol PresenterToViewSearchPageProtocol {
    func toView(movieList:String)
}

protocol PresenterToRouterSearchPageProtocol {
    static func creteModel(ref:SearchViewController)
}

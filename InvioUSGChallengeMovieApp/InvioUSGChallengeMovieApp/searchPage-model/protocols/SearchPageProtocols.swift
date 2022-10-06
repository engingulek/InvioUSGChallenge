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
    func getMovieAction(searchText:String)
}


protocol PresenterToInteractorSearchPageProtocol {
    var searhPagePresenter : InteractorToPresenterSearchPageProtocl? {get set}
    func getMovie(searchText:String)
    
}

protocol InteractorToPresenterSearchPageProtocl {
    func toPresenter (movieList:Array<Movie>)
}
protocol PresenterToViewSearchPageProtocol {
    func toView(movieList:Array<Movie>)
}

protocol PresenterToRouterSearchPageProtocol {
    static func creteModel(ref:SearchViewController)
}

protocol SearchWebServiceProtocol {
    func getSearchMovie(searchText:String,completion: @escaping (Result<MovieResult,Error>)->Void)
    
}

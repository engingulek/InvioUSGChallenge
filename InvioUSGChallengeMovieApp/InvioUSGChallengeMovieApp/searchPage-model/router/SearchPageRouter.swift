//
//  HomePageRouter.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation


class SearchPageRouter : PresenterToRouterSearchPageProtocol{
    static func creteModel(ref: SearchViewController) {
        let presenter  = SearchPagePresenter()
        ref.searchPageObject = presenter
        ref.searchPageObject?.interactor = SearchPageInteractor()
        ref.searchPageObject?.interactor?.searhPagePresenter = presenter
        ref.searchPageObject?.searchPageView = ref
    }
    
    
}

//
//  MovieDetailPageInteractor.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation
import Alamofire
class MovieDetailPageInteractor : PresenterToInteractorMovieDetailPageProtocol {
    var movieDetailPagePresenter: InteractorToPresenterMovieDetailPageProtocol?
    
    func getMovieDetail(movieImdbId: String) {
        AF.request("\(Constanst.baseUrl)i=\(movieImdbId)&apikey=\(Constanst.apiKey)&plot=full",method: .get).response{ response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(MovieDetail.self, from: data)
                    
                    if result.Response == "True" {
                        let movie = MovieDetail( Poster: result.Poster!,
                                               Title: result.Title!,
                                                Director: result.Director!,
                                                Genre: result.Genre!,
                                                Runtime: result.Runtime!,
                                                Writer: result.Writer!,
                                                Language: result.Language!,
                                                 Country: result.Country!,
                                                Plot: result.Plot!,
                                                 imdbRating: result.imdbRating!,
                                                Response: result.Response!)
                        
                        self.movieDetailPagePresenter?.toPresenter(movieDetail: movie)
                    }
                }catch{
                    
                }
            
            }
            
        }
    
    
}
}

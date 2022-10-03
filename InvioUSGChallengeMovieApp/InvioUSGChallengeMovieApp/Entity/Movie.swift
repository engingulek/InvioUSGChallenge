//
//  Movie.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation

struct Movie : Codable {
    var movieName:String?
    var movieImageUrl:String?
    var movieDirectedName:String?
    var movieGenre:String?
    var movieMinute:String?
    var movieImdbRating:String?
    var movieWriteName:String?
    var movieLaguage:String?
    var movieCountry:String?
    var movieRatings: Array<MovieRatings>?
    
    
    init(  movieName:String,
    movieImageUrl:String,
    movieDirectedName:String,
    movieGenre:String,
     movieMinute:String,
     movieImdbRating:String,
     movieWriteName:String,
     movieLaguage:String,
     movieCountry:String,
     movieRatings: Array<MovieRatings>){
        self.movieName = movieName
        self.movieImageUrl = movieImageUrl
        self.movieDirectedName = movieDirectedName
        self.movieGenre = movieGenre
        self.movieMinute = movieMinute
        self.movieImdbRating = movieImdbRating
        self.movieWriteName = movieWriteName
        self.movieLaguage = movieLaguage
        self.movieCountry = movieCountry
        self.movieRatings = movieRatings
       
    }
}

struct MovieRatings : Codable {
    var source:String?
    var value:String?
    init(source:String,value:String){
        self.source = source
        self.value = value
        
    }
}

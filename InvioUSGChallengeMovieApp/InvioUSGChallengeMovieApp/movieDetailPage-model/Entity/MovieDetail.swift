//
//  Entity.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import Foundation

struct MovieDetail : Codable {
    var Poster:String?
    var Title : String?
    var Director: String?
    var Genre: String?
    var Runtime:String?
    var Writer:String?
    var Language:String?
    var Country:String?
    var Plot:String?
    var imdbRating:String?
    var Response : String?
    
    
    init (
        Poster:String,Title: String,Director:String,Genre:String,Runtime:String,Writer:String,Language:String,Country:String,Plot:String,imdbRating:String,Response:String) {
            self.Poster = Poster
        self.Title = Title
        self.Director = Director
        self.Genre = Genre
        self.Runtime = Runtime
        self.Writer = Writer
        self.Language = Language
        self.Country = Country
        self.Plot = Plot
            self.imdbRating = imdbRating
        self.Response = Response
        
    }
}

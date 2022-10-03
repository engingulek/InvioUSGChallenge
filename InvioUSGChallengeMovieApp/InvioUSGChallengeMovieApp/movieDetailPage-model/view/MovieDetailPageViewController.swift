//
//  MovieDetailPageViewController.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import UIKit
import Kingfisher
class MovieDetailPageViewController: UIViewController {
    
     var movieImdbId:String?
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var movieDirectorNameLabel: UILabel!
    @IBOutlet private weak var moviePlotTextView: UITextView!
    @IBOutlet private weak var movieCountryLabel: UILabel!
    @IBOutlet private weak var movieLanguageLabel: UILabel!
    @IBOutlet private weak var movieWriterLabel: UILabel!
    @IBOutlet private weak var movieImdbRatingLabel: UILabel!
    @IBOutlet private weak var movieMinuteLabel: UILabel!
    @IBOutlet private weak var movieGenreLabel: UILabel!
    @IBOutlet private weak var movieName: UILabel!
    var movieDetailPageObject : ViewToPresenterMovieDetailPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieDetailPageRouter.createModel(ref: self)
        movieDetailPageObject?.getMovieDetailAction(movieImdbId: movieImdbId!)
    
    }
}

extension MovieDetailPageViewController : PresenterToViewMovieDetailPageProtocol {
    func toView(movieDetail: MovieDetail) {
       
        self.movieName.text = movieDetail.Title
        let imageUrl = URL(string: movieDetail.Poster!)
        self.movieImageView.kf.setImage(with: imageUrl)
        self.movieDirectorNameLabel.text = "Director by \( movieDetail.Director!)"
        self.movieGenreLabel.text = movieDetail.Genre
        self.movieWriterLabel.text = movieDetail.Writer
        self.movieLanguageLabel.text = movieDetail.Language
        self.movieCountryLabel.text = movieDetail.Country
        self.moviePlotTextView.text = movieDetail.Plot
        self.movieMinuteLabel.text = movieDetail.Runtime
        self.movieImdbRatingLabel.text = "\(movieDetail.imdbRating!)/10"
        
        
        
    }
}

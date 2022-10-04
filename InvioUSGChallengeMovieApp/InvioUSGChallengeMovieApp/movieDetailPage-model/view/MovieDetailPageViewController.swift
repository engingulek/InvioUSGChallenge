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
       
        self.movieName.text = movieDetail.Title == "N/A" ? "None" : movieDetail.Title
        if movieDetail.Poster == "N/A" {
            self.movieImageView.image = UIImage(named: "noneImage")
        }else{
            let imageUrl = URL(string: movieDetail.Poster!)
            self.movieImageView.kf.setImage(with: imageUrl)
        }
        self.movieDirectorNameLabel.text = "Director by \( movieDetail.Director!)"
        self.movieGenreLabel.text = movieDetail.Genre == "N/A" ? "None"  : movieDetail.Genre
        self.movieWriterLabel.text = movieDetail.Writer == "N/A" ? "None"  :  movieDetail.Writer
        self.movieLanguageLabel.text = movieDetail.Language == "N/A" ? "None"  :  movieDetail.Language
        self.movieCountryLabel.text = movieDetail.Country == "N/A" ? "None"  :  movieDetail.Country
        self.moviePlotTextView.text = movieDetail.Plot == "N/A" ? "None"  :  movieDetail.Plot
        self.movieMinuteLabel.text = movieDetail.Runtime == "N/A" ? "None"  :  movieDetail.Runtime
        self.movieImdbRatingLabel.text = movieDetail.imdbRating == "N/A" ? "None"  :  "\(movieDetail.imdbRating!)/10"
        
        
        
    }
}

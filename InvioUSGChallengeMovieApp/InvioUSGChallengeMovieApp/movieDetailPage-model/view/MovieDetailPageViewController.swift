//
//  MovieDetailPageViewController.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import UIKit

class MovieDetailPageViewController: UIViewController {
    @IBOutlet weak private var movieImageView: UIImageView!
     var movieImdbId:String?
    @IBOutlet weak var movieName: UILabel!
    var movieDetailPageObject : ViewToPresenterMovieDetailPageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieDetailPageRouter.createModel(ref: self)
    
    }
}

extension MovieDetailPageViewController : PresenterToViewMovieDetailPageProtocol {
    func toView(movieDetail: MovieDetail) {
        
    }
    
    
}

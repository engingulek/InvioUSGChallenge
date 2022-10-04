//
//  ViewController.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import UIKit
import Kingfisher
import SDWebImage
import Lottie
class SearchViewController: UIViewController {
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    var searchPageObject :  ViewtoPresenterSearchPageProtocol?
    @IBOutlet weak var movieResultCountLabel: UILabel!
    var movieList = [Movie]()
    @IBOutlet weak var searchMovieTextField: UITextField!
    var animationView :   AnimationView?

    
    @IBOutlet weak var loadingAnimation: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchPageRouter.creteModel(ref: self)
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieResultCountLabel.isHidden = true
        self.movieCollectionView.register(UINib(nibName: "SearchPageCollectionViewCell", bundle: nil),forCellWithReuseIdentifier:"movieImageCell")
        setupUI()
        loadingAnimation.startAnimating()
    }
}

// MARK : -Search Action fetch connet
extension SearchViewController {
    @IBAction func searchMovieAction(_ sender: Any) {
        self.loadingAnimation.isHidden = false
        self.loadingAnimation.startAnimating()
        if searchMovieTextField.text == "" {
            alertMessage(title: "Error", message: "Enter Movie to Search")
        }else{
            let searchText = searchMovieTextField.text?.capitalizeFirstLetter()
            self.searchPageObject?.getMovieAction(searchText: searchText!)
            self.loadingAnimation.stopAnimating()
            self.loadingAnimation.isHidden = true
            
        }
    }
}

extension SearchViewController : PresenterToViewSearchPageProtocol {
    func toView(movieList: Array<Movie>) {
        self.movieList = movieList
        DispatchQueue.main.async {
            self.loadingAnimation.stopAnimating()
            self.loadingAnimation.isHidden = true
            print("Count movie \(self.movieList.count)")
            if self.movieList.count == 0 {
                self.alertMessage(title: "Error", message: "No Movies")
                self.searchMovieTextField.text = ""
            }
            self.movieCollectionView.reloadData()
            self.movieResultCountLabel.isHidden = false
            self.movieResultCountLabel.text = "\(self.movieList.count) Movies"
        }
    }
}

// MARK: -SeachViewMoviewCollectionComtroller
extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : SearchPageCollectionViewCell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "movieImageCell", for: indexPath) as! SearchPageCollectionViewCell
        let movie = movieList[indexPath.item]
        if movie.Poster == "N/A" {
            print("Cell name \(movie.Title)")
            cell.movieImage.image = UIImage(named: "noneImage")
        }else{
            let imageUrl = URL(string: movie.Poster!)
            cell.movieImage.kf.setImage(with: imageUrl)
        }
        cell.movieName.text = movie.Title
        cell.layer.cornerRadius = 18
        return cell
     
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieImdbId = movieList[indexPath.item].imdbID
        performSegue(withIdentifier: "toMovieDetail", sender: movieImdbId)
    }
    
    // MARK: - MovieCollectionViewUIDesign
    private func setupUI() {
        let design : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        /// get movieCollectionViewWidth
        let widthMCV = self.movieCollectionView.frame.size.width
        let heightMCV =  self.movieCollectionView.frame.size.height
        design.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        design.itemSize = CGSize(width: widthMCV/2.5, height: heightMCV/2.5)
        design.minimumLineSpacing = 25
        design.minimumInteritemSpacing = 10
        movieCollectionView.collectionViewLayout = design
    }
    
    // MARK: -AlertMessage
    private func alertMessage(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAlertAction = UIAlertAction(title: "OKey", style: .cancel)
        alert.addAction(cancelAlertAction)
        self.present(alert, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetail" {
            if let imdbId = sender as? String {
                let toViewController = segue.destination as! MovieDetailPageViewController
                toViewController.movieImdbId = imdbId
            }
        }
    }
}






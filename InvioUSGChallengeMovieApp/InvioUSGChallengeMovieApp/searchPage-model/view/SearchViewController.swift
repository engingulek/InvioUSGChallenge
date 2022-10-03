//
//  ViewController.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    
    @IBOutlet weak var searchMovieTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        self.movieCollectionView.register(UINib(nibName: "SearchPageCollectionViewCell", bundle: nil),forCellWithReuseIdentifier:"movieImageCell")
        setupUI()
    }
    
    @IBAction func searchMovieAction(_ sender: Any) {
        if searchMovieTextField.text == "" {
            alertMessage(title: "Error", message: "Enter Movie to Search")
        }else{
            print(searchMovieTextField.text!)
        }
    }
    
}
// MARK: -SeachViewMoviewCollectionComtroller
extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : SearchPageCollectionViewCell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "movieImageCell", for: indexPath) as! SearchPageCollectionViewCell
        cell.layer.cornerRadius = 20
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMovieDetail", sender: nil)
    }
    
    // MARK: - MovieCollectionViewUIDesign
    private func setupUI() {
        let design : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        /// get movieCollectionViewWidth
        let widthMCV = self.movieCollectionView.frame.size.width
        let heightMCV =  self.movieCollectionView.frame.size.height
        design.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        design.itemSize = CGSize(width: widthMCV/2.5, height: heightMCV/3)
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
    
    
}






//
//  ViewController.swift
//  InvioUSGChallengeMovieApp
//
//  Created by engin gülek on 3.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet private weak var movieCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        setupUI()
    }
}
// MARK: -SeachViewMoviewCollectionComtroller
extension SearchViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "movieImageCell", for: indexPath)
        return cell
    }
    
    // MARK: - MovieCollectionViewUIDesign
    private func setupUI() {
        let design : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        /// get movieCollectionViewWidt
        let widthMCV = self.movieCollectionView.frame.size.width
        let heightMCV =  self.movieCollectionView.frame.size.height
        
        design.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        design.itemSize = CGSize(width: widthMCV/2.5, height: heightMCV/3)
        design.minimumLineSpacing = 25
        design.minimumInteritemSpacing = 10
        movieCollectionView.collectionViewLayout = design
        
    }
    
    
}






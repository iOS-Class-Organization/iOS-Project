//
//  ActivityGridViewController.swift
//  Time Killer
//
//  Created by John Smith V on 4/11/21.
//

import UIKit
import AlamofireImage

class ActivityGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var activityArray: [String] = ["Fitness", "Movies", "Cooking/Recipes", "Self-care"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Setting the spacing in-between the activity tiles
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
         
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
    
        
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        
        
        self.collectionView.reloadData()
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activityArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("We are creating the tiles for the activities")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityGridCell", for: indexPath) as! ActivityGridCell
        
//        let movie = movies[indexPath.item]
//
//        let baseURL = "https://image.tmdb.org/t/p/w185"
//        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: "https://www.stay-trained.com/wp-content/uploads/2018/04/Supplement-Fitness.jpg")
        cell.activityTypeView.af.setImage(withURL: posterURL!)
        
        return cell
    }

}

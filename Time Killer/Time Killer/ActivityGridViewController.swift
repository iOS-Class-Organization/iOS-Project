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
    
    // A dictionary that contains a Key, major activity categories, and values, the categories images
    var activityDict: [String: String] = ["Fitness": "https://www.stay-trained.com/wp-content/uploads/2018/04/Supplement-Fitness.jpg",
                                           "Movies": "https://cdn.designbump.com/wp-content/uploads/2014/08/movie-poster-cliches-15.jpg",
                                           "Cooking/Recipes": "https://www.eatwell101.com/wp-content/uploads/2019/04/chicken-bites-and-asparagus-recipe.jpg",
                                           "Self-care": "https://m.media-amazon.com/images/I/31zuGxhqxWL.jpg"]
    
    var activityArray: [String] = ["Fitness", "Movies", "Cooking/Recipes", "Self-care"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Setting the spacing in-between the activity tiles
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        // Making sure their are two images per row
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 2
    
        
        layout.itemSize = CGSize(width: width, height: width * 1.5)
        
        
        self.collectionView.reloadData()
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activityArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivityGridCell", for: indexPath) as! ActivityGridCell
        
        // Accessing the dictionary for each of the major categories and getting the image url; accessing the 1st element in the indexPath array because the index is in the 1st element
        let posterString = activityDict[activityArray[indexPath[1]]]!
        let posterURL = URL(string: posterString)
        cell.activityTypeView.af.setImage(withURL: posterURL!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        
        // Getting the index that was picked
        let indexPicked = collectionView.indexPath(for: cell)
        
        // Figuring out which category was picked
        let activityCategory = activityArray[indexPicked!.row]
        print("Index picked", activityCategory)

        // Need to pass the selected movie to the details view controller
        let activites = segue.destination as! ActivitySelectionViewController
        activites.category = activityCategory
    }

}

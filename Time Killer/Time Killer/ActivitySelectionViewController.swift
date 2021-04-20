//
//  ActivitySelectionViewController.swift
//  Time Killer
//
//  Created by Lucas Sun on 4/8/21.
//

import UIKit

class ActivitySelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    var category: String!
    
    var activityDict: [String: [String]] = ["Fitness": ["Baseball", "Basketball", "Cricket", "Running", "American Football", "Soccer", "Weight Training", "HIIT", "Yoga" ] ]
    
    var activityArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        activityArray = activityDict[category]!
        self.tableView.reloadData()
        print(activityArray)
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitySelectionTableViewCell") as! ActivitySelectionTableViewCell
        print(activityArray[indexPath.row])
        
        cell.activityName.text = activityArray[indexPath.row]
        
        return cell
    }
    

}

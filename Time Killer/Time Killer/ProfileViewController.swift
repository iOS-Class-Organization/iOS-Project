//
//  ProfileViewController.swift
//  Time Killer
//
//  Created by John Smith V on 4/8/21.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onLogOut(_ sender: Any) {
        // Want to logout of PF | clears the parse cache to signal that we are logged out
        PFUser.logOut()
        // Want to go back to the login screen
        self.dismiss(animated: true, completion: nil)
        // Want to make sure to set the variable so the app knows that we need to login
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

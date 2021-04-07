//
//  CreateAccountViewController.swift
//  Time Killer
//
//  Created by John Smith V on 4/1/21.
//

import UIKit
import Parse

class CreateAccountViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthDateOfUser: UIDatePicker!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreateAccount(_ sender: Any) {
        let username = userNameField.text
        let password = passwordField.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        // For some reason the date is four hours ahead, so subtracting 3600 seconds * 4 Hours gives us the proper time
        let date = birthDateOfUser.date - (3600 * 4)
        
        
        let user = PFUser()
        
        if !(username!.isEmpty) && !(password!.isEmpty) && !(firstName!.isEmpty) && !(lastName!.isEmpty) {
            user.username = username
            user.password = password
            
            user.signUpInBackground { (success, error) in
                if success {
                    self.performSegue(withIdentifier: "createAccountSegue", sender: nil)
                } else {
                    // If there's an error with signing up
                    print("Error: \(error?.localizedDescription)")
                }
            }
        } else {
            print("All of the fields have to be filled for you to create an account!\n")
        }
        
    }
    
    

}

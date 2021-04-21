//
//  ProfileViewController.swift
//  Time Killer
//
//  Created by Melaine SIt on 4/9/21.
//

import UIKit
import Parse
import AlamofireImage


class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var LastNameLabel: UILabel!
    @IBOutlet weak var CompletedLabel: UILabel!
    @IBOutlet weak var InProgressLabel: UILabel!
    @IBOutlet weak var ProfilePicImage: UIImageView!
    
    
    // prelabel of name and number of tasks they have completed
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = PFUser()
        
        // TODO: PFUser does not have a member first name and last name... need to find another way to store it
//        FirstNameLabel.text = user.firstName
//        LastNameLabel.text = user.lastName
        // grab the number of tasks completed
        // grab number of tasks in progress

        // Do any additional setup after loading the view.
    }
        
    // tap gesture that brings the photos library up
    @IBAction func tapPictureButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion : nil)
    }
    
    // This allows the picture to be formatted correctly in the given box
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 200, height:200)
        let scaledImage = image.af_imageAspectScaled(toFit: size)
        ProfilePicImage.image = scaledImage
        
        dismiss(animated: true, completion: nil)
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

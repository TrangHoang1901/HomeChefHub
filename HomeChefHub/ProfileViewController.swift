//
//  ProfileViewController.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/12/23.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    //var user: UserData!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBAction func isclickedSignOut(_ sender: UIButton) {
        let onboardingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "introView")
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = onboardingViewController
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentEmail = Auth.auth().currentUser?.email
        let user = UserData.getUsers().first(where: { $0.email == currentEmail })
        // Do any additional setup after loading the view.
        firstNameLabel.text = user?.firstName
        lastNameLabel.text = user?.lastName
        emailLabel.text = user?.email
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let navigationController = self.navigationController {
            // Navigate to the home screen
            navigationController.popToRootViewController(animated: true)

            // Hide the back button in the home screen
            navigationController.RegistrationViewController?.navigationItem.setHidesBackButton(true, animated: false)
        }

    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

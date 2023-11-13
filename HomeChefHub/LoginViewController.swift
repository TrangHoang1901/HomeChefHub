//
//  LoginViewController.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/11/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if error != nil {
                print("error")
                self.errorLabel.text = "InCorrect Email or Password"
                self.errorLabel.textColor = .white
            }
            else {
                // Go to Our Home Screen
                let onboardingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeScreenView")
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate,
                   let window = sceneDelegate.window {
                    window.rootViewController = onboardingViewController
                }
                //self.performSegue(withIdentifier: "introView", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currentEmail = Auth.auth().currentUser?.email
        let currentuser = UserData.getUsers().first(where: { $0.email == currentEmail })
        
        guard let addtoCookBookViewController = segue.destination as? AddtoCookBookViewController else { return }
        addtoCookBookViewController.currentUser = currentuser
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

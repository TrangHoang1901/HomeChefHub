//
//  SignupViewController.swift
//  HomeChefHub
//
//  Created by Helen Hoang on 11/11/23.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    var user: UserData!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func signupClicked(_ sender: UIButton) {
        guard let newemail = emailTextField.text else { return }
        guard let first = firstnameTextField.text else { return }
        guard let last = lastnameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().createUser(withEmail: newemail, password: password) { [self] firebaseResult, error in
            if error != nil {
                print("error")
                self.errorLabel.text = "Invalid Email or Password"
                self.errorLabel.textColor = .white
            }
            else {
                // Go to Our Home Screen
                let newUser = UserData(firstName: first, lastName: last, email: newemail)
                self.user = newUser  // Ensure 'user' is initialized before modifying its properties
                self.user.addUserProfile()
                self.user.printAllUsers()
                
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

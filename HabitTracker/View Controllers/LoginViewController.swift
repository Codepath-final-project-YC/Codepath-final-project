//
//  LoginViewController.swift
//  HabitTracker
//
//  Created by Yike Li on 11/24/20.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTrackHabitVC" {
            guard segue.destination is NormalTrackHabitViewController else { return }

        }
    }
    func setUpElements()  {
        // Hide the error label
        errorLabel.alpha = 0

        // Style the text forms
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToTrack()  {
        let trackViewController = storyboard?.instantiateViewController(identifier:"NormalTrackHabitVC") as? NormalTrackHabitViewController
        
        
        view.window?.rootViewController = trackViewController
        view.window?.makeKeyAndVisible()
        
        
    }
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        // Validate text fields
        
        // Signing in the user
        let email = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            if err != nil {
                // Couldn't sign in
                self.showError("Error in signing in")
            }
            else {
                self.performSegue(withIdentifier: "goToTrackHabitVC", sender: self)
            }
        }
        

    }
    
}

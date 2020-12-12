//
//  SignUpViewController.swift
//  HabitTracker
//
//  Created by Yike Li on 11/24/20.
//

import UIKit
import Firebase
import FirebaseAuth

struct CurrentUser {
   static var userId: String=""
}


class SignUpViewController: UIViewController {
    

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToComposeVC" {
            guard segue.destination is ComposeViewController else { return }

        }
        
    }
    
    
    func setUpElements()  {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the text forms
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
    }

    // Check the fields and validate the data is correct.
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
            
        // Check if the password is securied
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a speacial character and a number"
        }
        
        return nil
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    func transitionToCompose()  {
        let composeViewController = storyboard?.instantiateViewController(identifier: "ComposeVC") as? ComposeViewController
        
        
        view.window?.rootViewController = composeViewController
        view.window?.makeKeyAndVisible()
        
        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        } else
        {
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                     // There was an error creating the user
                    self.showError("Error in creating the user")
                }
                else {
                    // User was created successfully. Now store the information
                    let db = Firestore.firestore()

                    db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) { (err) in
                        if err != nil{
                            self.showError("Error when saving info in database")
                        }
                    }

                    
                    CurrentUser.userId = result!.user.uid
                    
                // Transition to the compose screen
                    self.performSegue(withIdentifier: "goToComposeVC", sender: self)
                    
                }
                
                
            }

        }
        
    }
    
}

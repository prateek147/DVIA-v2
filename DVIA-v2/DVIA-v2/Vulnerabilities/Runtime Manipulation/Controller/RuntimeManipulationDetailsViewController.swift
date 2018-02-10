//
//  RuntimeManipulationDetailsViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 25/11/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class RuntimeManipulationDetailsViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginMethod1Tapped(_ sender: Any) {
        if LoginValidate.isLoginValidated() {
            DVIAUtilities.showAlert(title: "Congratulations", message: "You have successfully bypassed the authentication check.", viewController: self)
        } else {
            DVIAUtilities.showAlert(title: "Oops", message: "Incorrect Username or Password", viewController: self)
        }
    }
    
    @IBAction func loginMethod2Tapped(_ sender: Any) {
        // TODO: change username and password text in this code.
        if usernameTextField.text == "" && passwordTextField.text == "" {
            DVIAUtilities.showAlert(title: "Congratulations", message: "You have successfully bypassed the authentication check.", viewController: self)
        } else {
            DVIAUtilities.showAlert(title: "Oops", message: "Incorrect Username or Password", viewController: self)
        }
    }
    
    @IBAction func readTutorialTapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: "http://highaltitudehacks.com/2013/11/08/ios-application-security-part-21-arm-and-gdb-basics", viewController: self)
    }
    
    @IBAction func validateCodeTapped(_ sender: Any) {
        if codeTextField.text == "181" {
            DVIAUtilities.showAlert(title: "Success", message: "Congratulations. You have cracked the code.", viewController: self)
        } else {
            DVIAUtilities.showAlert(title: "Failure", message: "Incorrect code.", viewController: self)
        }
    }
}

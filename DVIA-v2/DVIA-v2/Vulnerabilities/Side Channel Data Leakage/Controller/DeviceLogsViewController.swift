//
//  DeviceLogsViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 16/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit
import Parse
import os.log

class DeviceLogsViewController: UIViewController {
    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var phoneNoTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Device Logs"
    }

    @IBAction func signupTapped(_ sender: Any) {
        signUpButton.setTitle("Signing Up ...", for: .normal)
        let user = PFObject(className: "Person")
        user["name"] = nameTextField.text
        user["password"] = passwordTextField.text
        user["phone"] = phoneNoTextField.text
        user["email"] = emailTextField.text
        print("user saved: \(user.description)")
        user.saveInBackground(block: {(_ succeeded: Bool, _ error: Error?) -> Void in
            if succeeded {
                DVIAUtilities.showAlert(title: "Success", message: "User signed up successfully, look for the logs now", viewController: self)
                os_log("Saved user info: %@",user.description)
            } else {
                DVIAUtilities.showAlert(title: "Oops", message: "Sign Up failed.", viewController: self)
            }
            self.signUpButton.setTitle("Sign Up", for: .normal)
        })
    }
}

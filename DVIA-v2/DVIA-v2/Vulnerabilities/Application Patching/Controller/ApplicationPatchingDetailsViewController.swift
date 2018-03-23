//
//  ApplicationPatchingDetailsViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 04/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class ApplicationPatchingDetailsViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Application Patching"

        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else { return }
        if username == "Admin" && password == "This!sA5Ecret" {
            DVIAUtilities.showAlert(title: "", message: "SUCCESS", viewController: self)
        } else {
            DVIAUtilities.showAlert(title: "Oops", message: "Incorrect Username or Password", viewController: self)
        }
    }
    
    @IBAction func jailbreakTestTapped(_ sender: Any) {
        DVIAUtilities.showAlert(forJailbreakTestIsJailbroken: JailbreakDetection.isJailbroken(), viewController: self)
    }
    
    @IBAction func showAlertTapped(_ sender: Any) {
        DVIAUtilities.showAlert(title: "", message: "I love Google", viewController: self)
    }
    
    @IBAction func killApplicationTapped(_ sender: Any) {
        exit(-1)
    }
}

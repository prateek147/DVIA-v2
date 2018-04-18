//
//  ApplicationPatchingDetailsViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 04/12/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 


import UIKit

class ApplicationPatchingDetailsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        self.navigationItem.title = "Application Patching"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Application Patching"
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//
//  RuntimeManipulationDetailsViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 25/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
//  Let's make the world a better place for everyone :-)



import UIKit

class RuntimeManipulationDetailsViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var codeTextField: UITextField!
    let tutorialUrl:String = "http://highaltitudehacks.com/2013/11/08/ios-application-security-part-21-arm-and-gdb-basics"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Runtime Manipulation"
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
        DVIAUtilities.loadWebView(withURL:tutorialUrl , viewController: self)
    }
    
    @IBAction func validateCodeTapped(_ sender: Any) {
        LoginValidate.validateCode(Int(codeTextField.text!)!, viewController: self)
    }
    
}

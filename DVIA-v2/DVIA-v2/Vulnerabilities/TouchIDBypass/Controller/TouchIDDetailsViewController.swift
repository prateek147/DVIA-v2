//
//  SwiftTouchIDViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 17/03/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit
import LocalAuthentication

class TouchIDDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func touchIDTapped(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        DVIAUtilities.showAlert(title: "Success", message: "Authentication Successful", viewController: self)
                    } else {
                        DVIAUtilities.showAlert(title: "Error", message: "Authentication Failed", viewController: self)
                    }
                }
            }
        } else {
           DVIAUtilities.showAlert(title: "Touch ID not available", message: "Your device doesn't support Touch ID or you haven't configured Touch ID authentication on your device", viewController: self)
        }
    }
    
    
    @IBAction func touchIDTappedObjC(_ sender: Any) {
        TouchIDAuthentication.authenticateWithTouchID()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

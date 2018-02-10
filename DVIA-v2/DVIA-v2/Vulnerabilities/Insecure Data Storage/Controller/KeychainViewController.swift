//
//  KeychainViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class KeychainViewController: UIViewController {

    @IBOutlet var keychainTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveInKeychainTapped(_ sender: Any) {
        let bindings = PDKeychainBindings.shared()
        bindings?.setObject(keychainTextField.text, forKey: "keychainValue")
        DVIAUtilities.showAlert(title: "", message: "Data saved in Keychain", viewController: self)
    }
}

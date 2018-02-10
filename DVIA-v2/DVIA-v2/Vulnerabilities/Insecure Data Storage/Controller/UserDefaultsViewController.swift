//
//  UserDefaultsViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    @IBOutlet var userDefaultsTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveInUserDefaultsTapped(_ sender: Any) {
        let defaults: UserDefaults? = UserDefaults.standard
        defaults?.set(userDefaultsTextField.text, forKey: "DemoValue")
        defaults?.synchronize()
        DVIAUtilities.showAlert(title: "", message: "Data saved in NSUserDefaults", viewController: self)
    }

}

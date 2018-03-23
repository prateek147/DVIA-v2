//
//  PListViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class PListViewController: UIViewController {
        
    var vulnCode: Int = 0
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Plist"

    }
    
    @IBAction func saveInPlistFileTapped(_ sender: Any) {
       
        func documentsDirectory() -> String {
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let documentsDirectory = paths.first!
            return documentsDirectory
        }
        
        func dataFilePath ()->String{
            return documentsDirectory().appendingFormat("/userInfo.plist")
        }

        let data = NSMutableDictionary()
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        data.setValue(username, forKey: "username")
        data.setValue(password, forKey: "password")
        data.write(toFile: dataFilePath(), atomically: true)

        DVIAUtilities.showAlert(title: "", message: "Data saved in Plist", viewController: self)
    }

}

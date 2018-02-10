//
//  RealmViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {

    @IBOutlet var realmUserNameTextField: UITextField!
    @IBOutlet var realmPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveInRealmTapped(_ sender: Any) {
        let realm: Realm = try! Realm()
        let user = RealmUser()
        user.name = realmUserNameTextField.text
        user.password = realmPasswordTextField.text
        do {
            try! realm.write {
                realm.add(user)
            }
        }
    }
}

//
//  YapDatabaseViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class YapDatabaseViewController: UIViewController {

    @IBOutlet var yapDatabaseUsername: UITextField!
    @IBOutlet var yapDatabasePassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Yap Database"
}
  
    @IBAction func saveInYapDatabaseTapped(_ sender: Any) {
        let databaseName = "YapDatabase.sqlite"
        let baseUrl = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let databaseUrl = baseUrl.appendingPathComponent(databaseName, isDirectory: false)
        let databasePath = databaseUrl.path
        let database = YapDatabase(path: databasePath)
        let connection = database.newConnection()
        connection.readWrite { (_ transaction: YapDatabaseReadWriteTransaction) in
            let username = self.yapDatabaseUsername.text
            let password = self.yapDatabasePassword.text
            transaction.setObject(username, forKey: "Username", inCollection: "DVIA")
            transaction.setObject(password, forKey: "Password", inCollection: "DVIA")
            DVIAUtilities.showAlert(title: "", message: "Data saved in Yap Database", viewController: self)
        }
    }
}

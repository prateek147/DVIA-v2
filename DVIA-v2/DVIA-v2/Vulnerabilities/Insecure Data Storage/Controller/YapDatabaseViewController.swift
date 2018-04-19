//
//  YapDatabaseViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 


import UIKit

class YapDatabaseViewController: UIViewController {

    @IBOutlet var yapDatabaseUsername: UITextField!
    @IBOutlet var yapDatabasePassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Yap Database"
}

    @objc func backbuttonpressed() {
        
    }
  
    @IBAction func saveInYapDatabaseTapped(_ sender: Any) {
        if yapDatabaseUsername.text?.isEmpty ?? true || yapDatabasePassword.text?.isEmpty ?? true {
            DVIAUtilities.showAlert(title: "Error", message: "One or more input fields is empty.", viewController: self)
            return
        }
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

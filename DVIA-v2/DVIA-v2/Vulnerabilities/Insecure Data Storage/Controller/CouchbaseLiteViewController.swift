//
//  CouchbaseLiteViewController.swift
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

class CouchbaseLiteViewController: UIViewController {

    @IBOutlet var couchbaseUserName: UITextField!
    @IBOutlet var couchbasePassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Couchbase"
    }

    @IBAction func saveInCouchbaseTapped(_ sender: Any) {
        if couchbaseUserName.text?.isEmpty ?? true || couchbasePassword.text?.isEmpty ?? true {
            DVIAUtilities.showAlert(title: "Error", message: "One or more input fields is empty.", viewController: self)
            return
        }
        let database: CBLDatabase = try! CBLManager.sharedInstance().databaseNamed("dvcouchbasedb")
        guard let username = couchbaseUserName.text else { return }
        guard let password = couchbasePassword.text else { return }
        let properties: [String: Any] = ["username": username, "password": password]
        let newDocument = database.createDocument()
        do {
            try newDocument.putProperties(properties)
            DVIAUtilities.showAlert(title: "", message: "Data saved in Couchbase Lite Database", viewController: self)
        } catch let error {
            print(error)
        }
    }
}

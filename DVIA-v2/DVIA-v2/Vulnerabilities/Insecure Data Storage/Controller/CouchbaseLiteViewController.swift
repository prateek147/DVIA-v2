//
//  CouchbaseLiteViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class CouchbaseLiteViewController: UIViewController {

    @IBOutlet var couchbaseUserName: UITextField!
    @IBOutlet var couchbasePassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Couchbase"
    }

    @IBAction func saveInCouchbaseTapped(_ sender: Any) {
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

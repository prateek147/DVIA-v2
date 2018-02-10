//
//  CoreDataViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 14/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveInCoreDataTapped(_ sender: Any) {
        
        if #available(iOS 10.0, *) {
            let context = CoreDataStack.shared.persistentContainer.viewContext
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as? User
            newUser?.name = nameTextField.text
            newUser?.email = emailTextField.text
            newUser?.password = passwordTextField.text
            newUser?.phone = phoneTextField.text
            
            do {
                try context.save()
                DVIAUtilities.showAlert(title: "", message: "Data saved in Core Data", viewController: self)
            } catch let error {
                print(error)
                DVIAUtilities.showAlert(title: "", message: "Error Saved in Core Data", viewController: self)
            }
            
        } else {
            // Fallback on earlier versions
            let context = CoreDataStack.shared.managedObjectContext
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as? User
            newUser?.name = nameTextField.text
            newUser?.email = emailTextField.text
            newUser?.phone = phoneTextField.text
            newUser?.password = passwordTextField.text
            
            do {
                try context.save()
                DVIAUtilities.showAlert(title: "", message: "Data saved in Core Data", viewController: self)
            } catch let error {
                print(error)
                DVIAUtilities.showAlert(title: "", message: "Error Saved in Core Data", viewController: self)
            }
        }
    }
}

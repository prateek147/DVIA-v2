//
//  CoreDataViewController.swift
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
import CoreData

class CoreDataViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Core Data"

    }

    @IBAction func saveInCoreDataTapped(_ sender: Any) {
        
        if nameTextField.text?.isEmpty ?? true || emailTextField.text?.isEmpty ?? true || passwordTextField.text?.isEmpty ?? true || phoneTextField.text?.isEmpty ?? true {
            DVIAUtilities.showAlert(title: "Error", message: "One or more input fields is empty.", viewController: self)
            return
        }
        
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

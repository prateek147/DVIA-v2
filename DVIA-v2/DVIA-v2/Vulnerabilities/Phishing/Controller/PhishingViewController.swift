//
//  PhishingViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 17/03/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

class PhishingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }

    @IBAction func phishingPopup1Tapped(_ sender: Any) {
        let alert = UIAlertController(title: "Sign In to iTunes Store", message: "To continue, enter the password for \"test123@gmail.com\"", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Password"
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Sign In", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)


    }
    
    @IBAction func phishingPopup2Tapped(_ sender: Any) {
        let alert = UIAlertController(title: "Sign-In Required", message: "Sign In to manage your account.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Password"
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Sign In", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

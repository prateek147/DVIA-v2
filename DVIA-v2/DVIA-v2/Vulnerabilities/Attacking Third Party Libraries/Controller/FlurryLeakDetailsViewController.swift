//
//  FlurryLeakDetailsViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 4/16/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit
import Flurry_iOS_SDK


class FlurryLeakDetailsViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Device UDID for Flurry
        let identifierForVendor = UIDevice.current.identifierForVendor?.uuidString
        //Shouldn't be sending the whole UDID
        let strippedudid = identifierForVendor?.dropLast(10)
        textField.resignFirstResponder()
        let params: Dictionary = [
            "phone": textField.text,
            "udid" : strippedudid
            ] as [String : Any]
        Flurry.logEvent("PhoneEntered", withParameters:params as Any as! [AnyHashable : Any])
                return true
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


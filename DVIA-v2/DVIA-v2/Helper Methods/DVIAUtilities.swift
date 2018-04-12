//
//  DVIAUtilities.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 24/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
//  Let's make the world a better place for everyone :-)


import Foundation
import UIKit

class DVIAUtilities {
    
    class func loadWebView(withURL url: String, viewController: UIViewController) {
        if UIApplication.shared.canOpenURL(URL(string: url)!) {
            guard let url = URL(string: url) else { return }
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    class func showAlert(forJailbreakTestIsJailbroken isJaibroken: Bool, viewController: UIViewController) {
        if isJaibroken {
            let alertController = UIAlertController(title: "", message: "Device is Jailbroken", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            viewController.present(alertController, animated: true, completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "", message: "Device is Not Jailbroken", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(action)
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    class func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

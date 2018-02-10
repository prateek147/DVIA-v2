//
//  DVIAUtilities.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 24/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

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

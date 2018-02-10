//
//  JailbreakDetectionViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 23/11/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class JailbreakDetectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleMenuTap(_ sender: Any) {
        mainViewController?.toogle()
    }
    
    @IBAction func readArticleTapped(_ sender: Any) {
        let url = UrlLinks.jailbreakDetetionArticle.url
        DVIAUtilities.loadWebView(withURL: url, viewController: self)
    }
    
    @IBAction func jailbreakTest1Tapped(_ sender: Any) {
        DVIAUtilities.showAlert(forJailbreakTestIsJailbroken: isJailbroken(), viewController: self)
    }
    
    @IBAction func jailbreakTest2Tapped(_ sender: Any) {
        DVIAUtilities.showAlert(forJailbreakTestIsJailbroken: JailbreakDetection.isJailbroken(), viewController: self)
    }
    
    func isJailbroken() -> Bool {
        #if !SIMULATOR
            if FileManager.default.fileExists(atPath: "/Applications/Cydia.app") {
                return true
            }
            else if FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") {
                return true
            }
            else if FileManager.default.fileExists(atPath: "/bin/bash") {
                return true
            }
            else if FileManager.default.fileExists(atPath: "/usr/sbin/sshd") {
                return true
            }
            else if FileManager.default.fileExists(atPath: "/etc/apt") {
                return true
            }
            
            var error: Error?
            let stringToBeWritten = "This is a test."
            do {
                try stringToBeWritten.write(toFile: "/private/jailbreak.txt", atomically: true, encoding: .utf8)
            } catch let err {
                error = err
            }
            
            if error == nil {
                //Device is jailbroken
                return true
            }
            else {
                try? FileManager.default.removeItem(atPath: "/private/jailbreak.txt")
            }
            if UIApplication.shared.canOpenURL((URL(string: "cydia://package/com.example.package"))!) {
                //Device is jailbroken
                return true
            }
        #endif
        //All checks have failed. Most probably, the device is not jailbroken
        return false
    }

}

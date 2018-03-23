//
//  HomeViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTextView.text = DeviceInfo.getDeviceInfo();
        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleMenuTap(_ sender: Any) {
        mainViewController?.toogle()
    }
    
    @IBAction func twitterHandleTapped(_ sender: Any) {
        guard let twitterHandle: String = (sender as? UIButton)?.titleLabel?.text?.components(separatedBy: "@").last else { return }
        let twitterHandleURL = "https://twitter.com/\(twitterHandle)"
        DVIAUtilities.loadWebView(withURL: twitterHandleURL, viewController: self)
    }
    
    @IBAction func projectHomePageTapped(_ sender: Any) {
        let url = UrlLinks.homePage.url
        DVIAUtilities.loadWebView(withURL: url, viewController: self)
    }
}

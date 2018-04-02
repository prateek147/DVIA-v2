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
        //Bug Fix if view goes under the navigation bar
        self.edgesForExtendedLayout = []
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(menuTapped(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        homeTextView.text = DeviceInfo.getDeviceInfo();
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Home"
    }
    
    @IBAction func menuTapped(_ sender: Any) {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = " "
        if segue.identifier == "dvia" {
            if let destinationVC:DonateDetailsViewController = segue.destination as? DonateDetailsViewController {
                destinationVC.urlToLoad = "http://damnvulnerableiosapp.com"
                destinationVC.navigationItem.title = "DVIA"
            }
        }
    }
}

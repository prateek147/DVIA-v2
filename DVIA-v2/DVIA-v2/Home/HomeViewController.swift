//
//  HomeViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTextView: UITextView!
    var isTwitterProfile:Bool = false
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
        self.navigationItem.title = "Device Info"
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
        isTwitterProfile = false
    }
    
    @IBAction func twitterHandleTapped(_ sender: Any) {
        isTwitterProfile = true
        self.performSegue(withIdentifier:"dvia", sender: nil)
    }
    
    @IBAction func projectHomePageTapped(_ sender: Any) {
        let url = UrlLinks.homePage.url
        DVIAUtilities.loadWebView(withURL: url, viewController: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = " "
        if segue.identifier == "dvia" {
            if let destinationVC:DonateDetailsViewController = segue.destination as? DonateDetailsViewController {
                if(isTwitterProfile){
                    destinationVC.urlToLoad = "https://twitter.com/prateekg147"
                    destinationVC.navigationItem.title = "Twitter"
                }else{
                    destinationVC.urlToLoad = "http://damnvulnerableiosapp.com"
                    destinationVC.navigationItem.title = "DVIA"
                }
            }
        }
    }
}

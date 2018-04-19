//
//  RuntimeManipulationViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 23/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 


import UIKit

class RuntimeManipulationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(menuTapped(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        // Do any additional setup after loading the view.
        //Bug Fix if view goes under the navigation bar
        self.edgesForExtendedLayout = []
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Runtime Manipulation"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = " "
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }

    @IBAction func runtimeArticle1Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.runtimeArticle1.url, viewController: self)
    }
    
    @IBAction func runtimeArticle2Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.runtimeArticle1.url, viewController: self)
    }
    
    @IBAction func runtimeArticle3Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.runtimeArticle3.url, viewController: self)
    }
    
    @IBAction func runtimeArticle4Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.runtimeArticle4.url, viewController: self)
    }
    
    @IBAction func runtimeArticle5Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.runtimeArticle5.url, viewController: self)
    }
    
    @IBAction func runtimeArticle6Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.runtimeArticle6.url, viewController: self)
    }
    
    @IBAction func runtimeArticle7Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.runtimeArticle7.url, viewController: self)
    }
    
}

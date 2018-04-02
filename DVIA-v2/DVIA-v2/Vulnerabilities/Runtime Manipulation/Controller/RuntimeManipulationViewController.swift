//
//  RuntimeManipulationViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 23/11/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class RuntimeManipulationViewController: UIViewController {

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
        // Do any additional setup after loading the view.
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

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

        // Do any additional setup after loading the view.
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

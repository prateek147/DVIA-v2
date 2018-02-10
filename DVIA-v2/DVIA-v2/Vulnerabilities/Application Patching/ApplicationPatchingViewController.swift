//
//  ApplicationPatchingViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 04/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class ApplicationPatchingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }
    
    @IBAction func readArticle1Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.patchingApplicationArticle1.url, viewController: self)
    }
    
    @IBAction func readArticle2Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.patchingApplicationArticle2.url, viewController: self)
    }
    
}

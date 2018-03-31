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
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(menuTapped(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        self.navigationItem.title = "Application Patching"
        // Do any additional setup after loading the view.
    }

    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = " "
    }
    
    @IBAction func readArticle1Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.patchingApplicationArticle1.url, viewController: self)
    }
    
    @IBAction func readArticle2Tapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.patchingApplicationArticle2.url, viewController: self)
    }
    
}

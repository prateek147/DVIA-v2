//
//  SideChannelDataLeakageViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 30/11/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class SideChannelDataLeakageViewController: UITableViewController {

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
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }

}

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
        
        
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }

}

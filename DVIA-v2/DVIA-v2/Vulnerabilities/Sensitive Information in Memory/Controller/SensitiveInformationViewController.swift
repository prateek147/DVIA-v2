//
//  SensitiveInformationViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 04/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class SensitiveInformationViewController: UIViewController {
    let username = "edhillary"
    let password = "ev8848@1953"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sensitive Information in Memory"
    }

    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
        
    }
}

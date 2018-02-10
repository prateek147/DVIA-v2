//
//  SecurityDecisonsViaUntrustedInputViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 01/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class SecurityDecisonsViaUntrustedInputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }
}

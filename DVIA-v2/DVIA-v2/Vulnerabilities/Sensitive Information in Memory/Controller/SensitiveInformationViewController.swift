//
//  SensitiveInformationViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 04/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class SensitiveInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }
}

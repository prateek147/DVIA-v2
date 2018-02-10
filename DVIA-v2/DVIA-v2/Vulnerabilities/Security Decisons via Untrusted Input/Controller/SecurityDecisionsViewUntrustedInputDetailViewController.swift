//
//  SecurityDecisionsViewUntrustedInputDetailViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 01/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class SecurityDecisionsViewUntrustedInputDetailViewController: UIViewController {

    
    @IBOutlet var callStatusLabel: UILabel!
    @IBOutlet var enterNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func URLSchemeButtonTapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.URLSchemeArticle.url, viewController: self)
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        callStatusLabel.isHidden = false
        if enterNumberTextField.text?.count != 0 {
            guard let text = enterNumberTextField.text else { return }
            callStatusLabel.text = "Calling \(text). Ring Ring !!"
        }
    }
}

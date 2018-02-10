//
//  ClientSideInjectionDetailViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 02/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

class ClientSideInjectionDetailViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        setupWebViewUI()
    }
    
    func setupWebViewUI() {
        webView.layer.borderColor = UIColor.lightGray.cgColor
        webView.layer.borderWidth = 1
        webView.layer.cornerRadius = 2
    }

}

extension ClientSideInjectionDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let name: String = nameTextField.text else { return false }
        webView.loadHTMLString("Hello \(name), I am inside a WebView!", baseURL: nil)
        nameTextField.resignFirstResponder()
        return true
    }
}

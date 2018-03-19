//
//  DonateDetailsViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 3/19/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit
import WebKit

class DonateDetailsViewController: UIViewController, WKUIDelegate {
    
    public var urlToLoad:String! = ""
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:urlToLoad)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    

}

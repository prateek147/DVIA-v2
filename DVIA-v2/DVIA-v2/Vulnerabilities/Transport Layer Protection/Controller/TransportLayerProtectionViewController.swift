//
//  TransportLayerProtectionViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 02/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit
import Foundation

class TransportLayerProtectionViewController: UIViewController {

    @IBOutlet var cardNumberTextField: UITextField!
    @IBOutlet var CVVTextField: UITextField!
    @IBOutlet var nameOnCardTextField: UITextField!
    
    var isSSLPinning: Bool = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(menuTapped(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Network Layer Security"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = " "
    }
    
    @IBAction func checkATS(_ sender: Any) {
        DVIAUtilities.showAlert(title: "App Transport Security", message: "ATS establishes best-practice policies for secure network communications. Check whether the app follows these best practices or whether it ignore them. Look at the info.plist file", viewController: self)
    }
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }
    
    @IBAction func readArticleTapped(_ sender: Any) {
        DVIAUtilities.loadWebView(withURL: UrlLinks.transportLayerArticle.url, viewController: self)
    }
    
    @IBAction func sendOverHTTPTapped(_ sender: Any) {
        guard let url = URL(string: "http://google.com/") else { return }
        sendRequestOverUrl(url)
    }
 
    @IBAction func sendOverHTTPSTapped(_ sender: Any) {
        guard let url = URL(string: "https://google.com/") else { return }
        sendRequestOverUrl(url)
    }
    
   
    

    func sendRequestOverUrl(_ url: URL) {
        //initialize a request from url
        var request = URLRequest(url: url.standardized)
        request.httpMethod = "POST"
        let postDictionary = [
            "card_number" : cardNumberTextField.text,
            "card_name" : nameOnCardTextField.text,
            "card_cvv" : CVVTextField.text
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: postDictionary, options: .prettyPrinted)
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        //initialize a connection from request
        let connection = NSURLConnection(request: request, delegate: self)
        
        //start the connection
        connection?.start()
        DVIAUtilities.showAlert(title: "", message: "Request Sent, lookout!", viewController: self)
    }

}

extension TransportLayerProtectionViewController: UITextFieldDelegate, NSURLConnectionDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func send(usingSSLPinning sender: Any) {
        isSSLPinning = true
        let httpsURL = URL(string: "https://www.google.co.uk")
        let request = URLRequest(url: httpsURL!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        let connection = NSURLConnection(request: request, delegate: self)
        connection?.start()
    }
    
    // MARK: NSURLConnection Delegate Methods
    
    func connection(_ connection: NSURLConnection, willCacheResponse cachedResponse: CachedURLResponse) -> CachedURLResponse? {
        // Return nil to indicate not necessary to store a cached response for this connection
        return nil
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        // The request is complete and data has been received
        // You can parse the stuff in your instance variable now
        isSSLPinning = false
    }
    
    func connection(_ connection: NSURLConnection, didFailWithError error: Error) {
        // The request has failed for some reason!
        // Check the error var
    }
    
    func connection(_ connection: NSURLConnection, willSendRequestFor challenge: URLAuthenticationChallenge) {
        //Don't check for valid certificate when the user taps on "Send over HTTPs"
        if isSSLPinning {
            isSSLPinning = false
            guard let serverTrust = challenge.protectionSpace.serverTrust else { return }
            guard let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0) else { return }
            let remoteCetificateData = SecCertificateCopyData(certificate)
            let skabberCertificateData = NSData(contentsOfFile: Bundle.main.path(forResource: "google.co.uk", ofType: "cer")!)
            
            if remoteCetificateData == skabberCertificateData {
                DVIAUtilities.showAlert(title: "", message: "Request Sent using pinning, lookout!", viewController: self)
                let credential = URLCredential(trust: serverTrust)
                challenge.sender?.use(credential, for: challenge)
            } else {
                DVIAUtilities.showAlert(title: "", message: "Certificate validation failed. You will have to do better than this, my boy!!", viewController: self)
                challenge.sender?.cancel(challenge)
            }
        }
    }
}

//
//  CookiesViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 16/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

import UIKit

fileprivate let CookieUsername = "admin123"
fileprivate let CookiePassword = "dvpassword"
fileprivate let SiteURLString = "http://highaltitudehacks.com"


class CookiesViewController: UIViewController {

    @IBOutlet var cookiesUsernameTextField: UITextField!
    @IBOutlet var cookiesPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setSharedCookies()
        SetSharedCookies.setSharedCookies()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cookiesTestResultsButtonTapped(_ sender: Any) {
        let inputtedUsername = cookiesUsernameTextField.text
        let inputtedPassword = cookiesPasswordTextField.text
        let isRightUsername: Bool = inputtedUsername == CookieUsername
        let isRightPassword: Bool = inputtedPassword == CookiePassword
        if isRightUsername && isRightPassword {
            DVIAUtilities.showAlert(title: "Success!", message: "Congrats! You've found the right username and password!", viewController: self)
        }
        else {
            DVIAUtilities.showAlert(title: "Failure", message: "Well, your answer is not right.", viewController: self)
        }
    }
}

extension CookiesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func setSharedCookies() {

        var components = DateComponents()
        components.setValue(5, for: .month)
        let date = Date()
        let expirationDate = Calendar.current.date(byAdding: components, to: date)

        let expireInterval = expirationDate?.timeIntervalSince1970
        
        guard let siteUrl = URL(string: SiteURLString) else { return }

        let usernameProperties: [HTTPCookiePropertyKey : Any] = [.domain: siteUrl.host ?? "",
                                                                 .path: siteUrl.path,
                                                                 .name: "username",
                                                                 .value: CookieUsername,
                                                                 .expires: expireInterval!]
        guard let usernameCookie = HTTPCookie(properties: usernameProperties) else {return}
        
        let passwordProperties: [HTTPCookiePropertyKey: Any] = [.domain: siteUrl.host ?? "",
                                                                .path: siteUrl.path,
                                                                .name: "password",
                                                                .value: CookiePassword,
                                                                .expires: expireInterval!]
        guard let passwordCookie = HTTPCookie(properties: passwordProperties) else {return}
        
        HTTPCookieStorage.shared.setCookies([usernameCookie, passwordCookie], for: siteUrl, mainDocumentURL: nil)
    }
}

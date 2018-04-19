//
//  CookiesViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 16/12/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 


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
        self.navigationItem.title = "Cookies"
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

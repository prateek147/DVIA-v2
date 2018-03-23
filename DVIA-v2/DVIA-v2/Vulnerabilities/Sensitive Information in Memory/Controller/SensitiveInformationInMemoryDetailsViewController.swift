//
//  SensitiveInformationInMemoryDetailsViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 23/03/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

class SensitiveInformationInMemoryDetailsViewController: UIViewController {
    let username = "edhillary"
    let password = "ev8848@1953"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sensitive Information in Memory"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeIVars(){
        let passwd = "tenzinnorgay"
        let concatenated = username + passwd + password
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

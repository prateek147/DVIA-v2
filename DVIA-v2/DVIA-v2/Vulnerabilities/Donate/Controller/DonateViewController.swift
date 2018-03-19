//
//  DonateViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 15/03/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {
    var video:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        mainViewController?.toogle()
    }
    
    @IBAction func goToWebsiteTapped(_ sender: Any) {
        video = false
        self.performSegue(withIdentifier: "juniperFund", sender: self)
    }
    
    @IBAction func seeVideoTapped(_ sender: Any) {
        video = true
        self.performSegue(withIdentifier: "juniperFund", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "juniperFund" {
            if let destinationVC:DonateDetailsViewController = segue.destination as? DonateDetailsViewController {
                if(!video){
                destinationVC.urlToLoad = "http://www.thejuniperfund.org/"
                }else{
                destinationVC.urlToLoad = "https://www.youtube.com/watch?v=HsV6jaA5J2I"
                }
            }
        }
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

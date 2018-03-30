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
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "menu.png"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(menuTapped(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Donate"
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
            self.navigationItem.title = " "
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

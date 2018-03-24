//
//  AntiAntiHookingDebuggingViewController.swift
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 3/21/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import UIKit

class AntiAntiHookingDebuggingViewController: UIViewController {
    var timer = Timer()
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

    @IBAction func disableDebuggingTapped(_ sender: Any) {
        disable_gdb()
        DVIAUtilities.showAlert(title: "", message: "Debugger Protection applied.", viewController: self)
    }
    
    @IBAction func disableInjection(_ sender: Any) {
        //In case someone taps this button twice
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5.0,
                                     target: self,
                                     selector: #selector(eventWith(timer:)),
                                     userInfo: nil,
                                     repeats: true)
        DVIAUtilities.showAlert(title: "", message: "Detecting Injected Libraries now.", viewController: self)
    }
    
    @objc func eventWith(timer: Timer!) {
        detect_injected_dylds()
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

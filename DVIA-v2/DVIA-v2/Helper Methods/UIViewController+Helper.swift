//
//  UIViewController+Helper.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 23/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import Foundation
import UIKit

protocol ContainerViewControllerProtocol: class {
    
    var visibleViewController: UIViewController? { get set }
    
    func addControllerAsChild(childController: UIViewController, insideView containerView: UIView)
    
}

extension ContainerViewControllerProtocol where Self: UIViewController {
    
    func addControllerAsChild(childController: UIViewController, insideView containerView: UIView) {
        DispatchQueue.main.async {
            self.addChildViewController(childController)
            childController.view.frame = containerView.bounds
            childController.willMove(toParentViewController: self)
            containerView.addSubview(childController.view)
            childController.didMove(toParentViewController: self)
        }
    }
}

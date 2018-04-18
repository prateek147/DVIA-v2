//
//  RootViewController.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 

import UIKit

class RootViewController: UIViewController {
    
    @IBOutlet var homeContainerView: UIView!
    @IBOutlet var overlay: UIView!
    @IBOutlet var sideMenuContainerView: UIView!
    @IBOutlet var sideMenuContainerWidthConstraint: NSLayoutConstraint!
    @IBOutlet var homeContainerWidthConstraint: NSLayoutConstraint!
    @IBOutlet var homeContainerTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var homeContainerLeadingConstraint: NSLayoutConstraint!
    
    var visibleViewController: UIViewController?
    var homeViewController: HomeViewController?
    
    var homeVC: UINavigationController?
    var menuVC: SideMenuViewController?

    var isMenuOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeContainerWidthConstraint.constant = view.frame.width
        sideMenuContainerWidthConstraint.constant = view.frame.width / 4 * 3
        showHome()
        dismissMenu()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SideMenuViewController {
            menuVC = segue.destination as? SideMenuViewController
            menuVC?.delegate = self
        }
    }
}

extension RootViewController {
 
    
    func toogle() {
        isMenuOpen ? dismissMenu() : openMenu()
    }
    
    public func openMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.homeContainerTrailingConstraint.constant = -self.sideMenuContainerWidthConstraint.constant
            self.homeContainerLeadingConstraint.constant = self.sideMenuContainerWidthConstraint.constant
            self.view.layoutIfNeeded()
        }) { (_) in
            self.isMenuOpen = true
            self.overlay.isHidden = false
        }
    }
    
    public func dismissMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.homeContainerTrailingConstraint.constant = 0
            self.homeContainerLeadingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { (_) in
            self.isMenuOpen = false
            self.overlay.isHidden = true
        }
    }
}

extension RootViewController: SideMenuViewControllerDelegate, ContainerViewControllerProtocol {
    func menuItemControllerDelegate(vc: SideMenuViewController, item: MenuCellItem) {
        switch item {
        case .home:
            showHome()
        case .insecureDataStorage:
            showInsecureDataStorage()
        case .jailbreakDetection:
            showJailbreakDetection()
        case .excessivePermissions:
            showExcessivePermissions()
        case .runtimeManipulation:
            showRuntimeManipulation()
        case .antiAntiHookingDebugging:
            showAntiAntiHookingDebugging()
        case .binaryProtection:
            showBinaryProtection()
        case .touchIDBypass:
            showTouchIDBypass()
        case .sideChannelDataLeakage:
            showSideChannelDataLeakage()
        case .securityDecisonsViaUntrustedInput:
            showSecurityDecisionViaUntrustedInput()
        case .brokenCryptography:
            showBrokenCryptography()
        case .clientSideInjection:
            showClientSideInjection()
        case .transportLayerProtection:
            showTransportLayerProtection()
        case .applicationPatching:
            showApplicationPatching()
        case .sensitiveInformation:
            showSensitiveInformation()
        case .attackingThirdPartyLibraries:
             showAttackingThirdPartyLibraries()
        case .phishing:
            showPhishing()
        case .donate:
            showDonate()
        }
        toogle()
    }
    
    func addControllerAsChild(childController: UIViewController) {
        
        visibleViewController?.view.removeFromSuperview()
        addControllerAsChild(childController: childController, insideView: self.homeContainerView)
        visibleViewController = childController
        
        // call gestures on visible views.
        setupGestures()
    }

    func showHome() {
        overlay.isHidden = true
        if let homeVC = homeVC {
            addControllerAsChild(childController: homeVC)
        } else {
            let storyboard = UIStoryboard(name: Storyboard.home.name, bundle: nil)
            if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
                homeVC = controller
                addControllerAsChild(childController: controller)
            }
        }
    }
    
    func showInsecureDataStorage() {
        let storyboard = UIStoryboard(name: Storyboard.insecureDataStorage.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showAntiAntiHookingDebugging() {
        let storyboard = UIStoryboard(name: Storyboard.antiAntiHookingDebugging.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showJailbreakDetection() {
        let storyboard = UIStoryboard(name: Storyboard.jailbreakDetection.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showDonate(){
        let storyboard = UIStoryboard(name: Storyboard.donate.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)}
    }
    
    func showExcessivePermissions() {
        let storyboard = UIStoryboard(name: Storyboard.excessivePermissions.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showRuntimeManipulation() {
        let storyboard = UIStoryboard(name: Storyboard.runtimeManipulation.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showBinaryProtection() {
        let storyboard = UIStoryboard(name: Storyboard.binaryProtection.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showPhishing() {
        let storyboard = UIStoryboard(name: Storyboard.phishing.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showTouchIDBypass() {
        let storyboard = UIStoryboard(name: Storyboard.touchIDBypass.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showSideChannelDataLeakage() {
        let storyboard = UIStoryboard(name: Storyboard.sideChannelDataLeakage.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showSecurityDecisionViaUntrustedInput() {
        let storyboard = UIStoryboard(name: Storyboard.securityDecisonsViaUntrustedInput.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showBrokenCryptography() {
        let storyboard = UIStoryboard(name: Storyboard.brokenCryptography.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showClientSideInjection() {
        let storyboard = UIStoryboard(name: Storyboard.clientSideInjection.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showTransportLayerProtection() {
        let storyboard = UIStoryboard(name: Storyboard.transportLayerProtection.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showApplicationPatching() {
        let storyboard = UIStoryboard(name: Storyboard.applicationPatching.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showSensitiveInformation() {
        let storyboard = UIStoryboard(name: Storyboard.sensitiveInformation.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showAttackingThirdPartyLibraries() {
        let storyboard = UIStoryboard(name: Storyboard.attackingThirdPartyLibraries.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
}

extension UIViewController {
    var mainViewController: RootViewController? {
        var selfController = self
        while let parentController = selfController.parent {
            if  let controller = parentController as? RootViewController {
                return controller
            } else {
                selfController = parentController
            }
        }
        return nil
    }
}

extension RootViewController {
    
    func setupGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe(recognizer:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe(recognizer:)))
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        overlay?.addGestureRecognizer(swipeLeft)
        visibleViewController?.view.addGestureRecognizer(swipeRight)
        
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        overlay?.addGestureRecognizer(tapGesture)
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        if (self.isMenuOpen){ dismissMenu()}
    }
    
    @objc func handleLeftSwipe(recognizer: UISwipeGestureRecognizer) {
        dismissMenu()
    }
    
    @objc func handleRightSwipe(recognizer: UISwipeGestureRecognizer) {
        openMenu()
    }
}

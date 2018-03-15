//
//  RootViewController.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

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
        case .privateAPIs:
            showPrivateAPIs()
        case .runtimeManipulation:
            showRuntimeManipulation()
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
    
    func showJailbreakDetection() {
        let storyboard = UIStoryboard(name: Storyboard.jailbreakDetection.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
    }
    
    func showPrivateAPIs() {
        let storyboard = UIStoryboard(name: Storyboard.privateAPIs.name, bundle: nil)
        if let controller = storyboard.instantiateInitialViewController() as? UINavigationController {
            addControllerAsChild(childController: controller)
        }
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
    }
    
    @objc func handleLeftSwipe(recognizer: UISwipeGestureRecognizer) {
        dismissMenu()
    }
    
    @objc func handleRightSwipe(recognizer: UISwipeGestureRecognizer) {
        openMenu()
    }
}

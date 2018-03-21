//
//  MenuCellItem.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 22/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import Foundation

struct MenuItem {
    var cellModels: [Any] = []
}

enum MenuCellItem {
    case home
    case insecureDataStorage
    case jailbreakDetection
    case excessivePermissions
    case privateAPIs
    case runtimeManipulation
    case binaryProtection
    case antiAntiHookingDebugging
    case touchIDBypass
    case sideChannelDataLeakage
    case securityDecisonsViaUntrustedInput
    case brokenCryptography
    case clientSideInjection
    case transportLayerProtection
    case applicationPatching
    case sensitiveInformation
    case attackingThirdPartyLibraries
    case phishing
    case donate
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .insecureDataStorage:
            return "Local Data Storage"
        case .jailbreakDetection:
            return "Jailbreak Detection"
        case .excessivePermissions:
            return "Excessive Permissions"
        case .privateAPIs:
            return "Private APIs"
        case .antiAntiHookingDebugging:
            return "Anti Anti Hooking/Debugging"
        case .runtimeManipulation:
            return "Runtime Manipulation"
        case .binaryProtection:
            return "Binary Protection"
        case .touchIDBypass:
            return "Touch/Face ID Bypass"
        case .phishing:
            return "Phishing"
        case .sideChannelDataLeakage:
            return "Side Channel Data Leakage"
        case .securityDecisonsViaUntrustedInput:
            return "IPC Issues"
        case .brokenCryptography:
            return "Broken Cryptography"
        case .clientSideInjection:
            return "Webview Issues"
        case .transportLayerProtection:
            return "Network Layer Security"
        case .applicationPatching:
            return "Application Patching"
        case .sensitiveInformation:
            return "Sensitive Information in Memory"
        case .attackingThirdPartyLibraries:
            return "Attacking Third Party Libraries"
        case .donate:
            return "Donate - The Juniper Fund"
        }
    }
}



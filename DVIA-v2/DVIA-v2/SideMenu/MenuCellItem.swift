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
    case sideChannelDataLeakage
    case securityDecisonsViaUntrustedInput
    case brokenCryptography
    case clientSideInjection
    case transportLayerProtection
    case applicationPatching
    case sensitiveInformation
    case attackingThirdPartyLibraries
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .insecureDataStorage:
            return "Insecure Data Storage"
        case .jailbreakDetection:
            return "Jailbreak Detection"
        case .excessivePermissions:
            return "Excessive Permissions"
        case .privateAPIs:
            return "Private APIs"
        case .runtimeManipulation:
            return "Runtime Manipulation"
        case .sideChannelDataLeakage:
            return "Side Channel Data Leakage"
        case .securityDecisonsViaUntrustedInput:
            return "Security Decisons Via Untrusted sInput"
        case .brokenCryptography:
            return "Broken Cryptography"
        case .clientSideInjection:
            return "Client Side Injection"
        case .transportLayerProtection:
            return "Transport Layer Protection"
        case .applicationPatching:
            return "Application Patching"
        case .sensitiveInformation:
            return "Sensitive Information in Memory"
        case .attackingThirdPartyLibraries:
            return "Attacking Third Party Libraries"
        }
    }
}



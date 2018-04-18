//
//  MenuCellItem.swift
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
 

import Foundation

struct MenuItem {
    var cellModels: [Any] = []
}

enum MenuCellItem {
    case home
    case insecureDataStorage
    case jailbreakDetection
    case excessivePermissions
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
            return "Device Info"
        case .insecureDataStorage:
            return "Local Data Storage"
        case .jailbreakDetection:
            return "Jailbreak Detection"
        case .excessivePermissions:
            return "Excessive Permissions"
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
            return "Data Leakage to Third parties"
        case .donate:
            return "Donate - The Juniper Fund"
        }
    }
}



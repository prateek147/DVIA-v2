//
//  Storyboards.swift
//  DVIA
//
//  Created by Prateek Gianchandani on 23/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

import Foundation

enum Storyboard: String {
    
    case home = "Home"
    case insecureDataStorage = "InsecureDataStorage"
    case runtimeManipulation = "RuntimeManipulation"
    case binaryProtection = "BinaryProtection"
    case excessivePermissions = "ExcessivePermissions"
    case privateAPIs = "PrivateAPIs"
    case touchIDBypass = "TouchIDBypass"
    case sideChannelDataLeakage = "SideChannelDataLeakage"
    case securityDecisonsViaUntrustedInput = "SecurityDecisonsViaUntrustedInput"
    case brokenCryptography = "BrokenCryptography"
    case clientSideInjection = "ClientSideInjection"
    case transportLayerProtection = "TransportLayerProtection"
    case applicationPatching = "ApplicationPatching"
    case sensitiveInformation = "SensitiveInformation"
    case attackingThirdPartyLibraries = "AttackingThirdPartyLibraries"
    case jailbreakDetection = "JailbreakDetection"
    case phishing = "Phishing"
    case donate = "Donate"

    
    var name: String {
        return self.rawValue
    }
}

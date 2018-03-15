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
    case excessivePermissions = "ExcessivePermissions"
    case privateAPIs = "PrivateAPIs"
    case sideChannelDataLeakage = "SideChannelDataLeakage"
    case securityDecisonsViaUntrustedInput = "SecurityDecisonsViaUntrustedInput"
    case brokenCryptography = "BrokenCryptography"
    case clientSideInjection = "ClientSideInjection"
    case transportLayerProtection = "TransportLayerProtection"
    case applicationPatching = "ApplicationPatching"
    case sensitiveInformation = "SensitiveInformation"
    case attackingThirdPartyLibraries = "AttackingThirdPartyLibraries"
    case jailbreakDetection = "JailbreakDetection"

    
    var name: String {
        return self.rawValue
    }
}

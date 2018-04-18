//
//  Constants.swift
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 24/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 

import Foundation

enum UrlLinks {
    case insecureDataStorageArticle
    case homePage
    case jailbreakDetetionArticle
    case runtimeArticle1
    case runtimeArticle2
    case runtimeArticle3
    case runtimeArticle4
    case runtimeArticle5
    case runtimeArticle6
    case runtimeArticle7
    case URLSchemeArticle
    case transportLayerArticle
    case patchingApplicationArticle1
    case patchingApplicationArticle2

    var url: String {
        switch self {
        case .insecureDataStorageArticle:
            return "http://highaltitudehacks.com/2013/10/26/ios-application-security-part-20-local-data-storage-nsuserdefaults"
        case .homePage:
            return "http://damnvulnerableiosapp.com"
        case .jailbreakDetetionArticle:
            return "http://highaltitudehacks.com/2013/12/17/ios-application-security-part-24-jailbreak-detection-and-evasion"
        case .runtimeArticle1:
            return "http://highaltitudehacks.com/2013/06/16/ios-application-security-part-3-understanding-the-objective-c-runtime"
        case .runtimeArticle2:
            return "http://highaltitudehacks.com/2013/07/02/ios-aios-appllication-security-part-4-runtime-analysis-using-cycript-yahoo-weather-app"
        case .runtimeArticle3:
            return "http://highaltitudehacks.com/2013/07/02/ios-application-security-part-5-advanced-runtime-analysis-and-manipulation-using-cycript-yahoo-weather-app"
        case .runtimeArticle4:
            return "http://highaltitudehacks.com/2013/07/25/ios-application-security-part-8-method-swizzling-using-cycript"
        case .runtimeArticle5:
            return "http://highaltitudehacks.com/2013/09/17/ios-application-security-part-16-runtime-analysis-of-ios-applications-using-inalyzer"
        case .runtimeArticle6:
            return "http://highaltitudehacks.com/2013/11/08/ios-application-security-part-21-arm-and-gdb-basics"
        case .runtimeArticle7:
            return "http://highaltitudehacks.com/2013/12/17/ios-application-security-part-22-runtime-analysis-and-manipulation-using-gdb"
        case .URLSchemeArticle:
            return "http://highaltitudehacks.com/2014/03/07/ios-application-security-part-30-attacking-url-schemes"
        case .transportLayerArticle:
            return "http://highaltitudehacks.com/2013/08/20/ios-application-security-part-11-analyzing-network-traffic-over-http-slash-https"
        case .patchingApplicationArticle1:
            return "http://highaltitudehacks.com/2013/12/17/ios-application-security-part-26-patching-ios-applications-using-ida-pro-and-hex-fiend"
        case .patchingApplicationArticle2:
            return "http://highaltitudehacks.com/2014/01/17/ios-application-security-part-28-patching-ios-application-with-hopper"
        }
    }
}

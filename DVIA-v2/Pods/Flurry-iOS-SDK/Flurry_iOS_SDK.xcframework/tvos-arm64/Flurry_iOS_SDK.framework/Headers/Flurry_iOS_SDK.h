//
//  Flurry_iOS_SDK.h
//  Flurry
//
//  Copyright © 2022 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#else
#import <SystemConfiguration/SystemConfiguration.h>
#import <UIKit/UIKit.h>
#endif

//! Project version number for Flurry_iOS_SDK.
FOUNDATION_EXPORT double Flurry_iOS_SDKVersionNumber;

//! Project version string for Flurry_iOS_SDK.
FOUNDATION_EXPORT const unsigned char Flurry_iOS_SDKVersionString[];


#if TARGET_OS_WATCH
#import <Flurry_iOS_SDK/FlurryWatch.h>
#else
#import <Flurry_iOS_SDK/Flurry+Event.h>
#if !TARGET_OS_TV
#import <Flurry_iOS_SDK/FlurrySKAdNetwork.h>
#endif
#endif

#import <Flurry_iOS_SDK/Flurry.h>
#import <Flurry_iOS_SDK/FlurrySessionBuilder.h>
#import <Flurry_iOS_SDK/FlurryUserProperties.h>
#import <Flurry_iOS_SDK/FlurryCCPA.h>
#import <Flurry_iOS_SDK/FlurryConsent.h>

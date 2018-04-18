//
//  SetSharedCookies.m
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 16/12/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 


#import <Foundation/Foundation.h>
#import "SetSharedCookies.h"

static NSString *const SiteURLString = @"http://highaltitudehacks.com";
static NSString *const CookieUsername = @"admin123";
static NSString *const CookiePassword = @"dvpassword";


@implementation SetSharedCookies

+ (void)setSharedCookies {
    NSDate *currentDate = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:currentDate];
    [components setMonth:components.month + 5];
    NSDate *expireDate = [calendar dateByAddingComponents:components toDate:currentDate options:0];
    NSTimeInterval expireInterval = [expireDate timeIntervalSince1970];
    
    NSURL *siteURL = [NSURL URLWithString:SiteURLString];
    NSDictionary *usernameProperties = @{
                                         NSHTTPCookieDomain : siteURL.host,
                                         NSHTTPCookiePath : siteURL.path,
                                         NSHTTPCookieName : @"username",
                                         NSHTTPCookieValue : CookieUsername,
                                         NSHTTPCookieExpires : @(expireInterval)
                                         };
    NSHTTPCookie *usernameCookie = [[NSHTTPCookie alloc] initWithProperties:usernameProperties];
    
    NSDictionary *passwordProperties = @{
                                         NSHTTPCookieDomain : siteURL.host,
                                         NSHTTPCookiePath : siteURL.path,
                                         NSHTTPCookieName : @"password",
                                         NSHTTPCookieValue : CookiePassword,
                                         NSHTTPCookieExpires : @(expireInterval)
                                         };
    NSHTTPCookie *passwordCookie = [[NSHTTPCookie alloc] initWithProperties:passwordProperties];
    
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookies:@[usernameCookie, passwordCookie] forURL:siteURL mainDocumentURL:nil];
}

@end

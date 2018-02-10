//
//  SetSharedCookies.m
//  DVIA
//
//  Created by Prateek Gianchandani on 16/12/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

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

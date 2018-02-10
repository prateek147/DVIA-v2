//
//  LoginValidate.m
//  DVIA
//
//  Created by Prateek Gianchandani on 27/11/17.
//  Copyright © 2017 HighAltitudeHacks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginValidate.h"

@implementation LoginValidate

+(BOOL)isLoginValidated {
    //I know this logic looks wierd, but you can still bypass this authorization check, trust me
    if(3 < 1){
        return YES;
    }
    return NO;
}

@end

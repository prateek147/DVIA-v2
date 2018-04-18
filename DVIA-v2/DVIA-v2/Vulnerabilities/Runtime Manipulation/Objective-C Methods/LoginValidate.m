//
//  LoginValidate.m
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 27/11/17.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 


#import <Foundation/Foundation.h>
#import "LoginValidate.h"

@implementation LoginValidate

+(BOOL)isLoginValidated {
    //I know this logic looks weird, but you can still bypass this authorization check, trust me
    if(3 < 1){
        return YES;
    }
    return NO;
}

+(void)validateCode:(NSInteger)code viewController:(UIViewController *)viewController {
    if (code==8848){
        UIAlertController *_alertController = [UIAlertController alertControllerWithTitle:@"Success" message:@"8848: Congratulations, you cracked the code!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:nil];
        [_alertController addAction:okButton];
        [viewController presentViewController:_alertController animated:YES completion:nil];
        return ;
    }
    UIAlertController *_alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"%ld: Incorrect Code", (long)code] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleDefault
                               handler:nil];
    [_alertController addAction:okButton];
    [viewController presentViewController:_alertController animated:YES completion:nil];
    return ;
}

@end

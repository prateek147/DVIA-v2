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

//
//  PDKeychainBindings.m
//  PDKeychainBindings
//
//  Created by Carl Brown on 7/10/11.
//  Copyright 2011 PDAgent, LLC. Released under MIT License.
//

#import "PDKeychainBindings.h"
#import "PDKeychainBindingsController.h"

@implementation PDKeychainBindings

+ (PDKeychainBindings *)sharedKeychainBindings
{
	return [[PDKeychainBindingsController sharedKeychainBindingsController] keychainBindings];
}

- (id)objectForKey:(NSString *)defaultName {
    //return [[[PDKeychainBindingsController sharedKeychainBindingsController] valueBuffer] objectForKey:defaultName];
    return [[PDKeychainBindingsController sharedKeychainBindingsController] valueForKeyPath:[NSString stringWithFormat:@"values.%@",defaultName]];
}

- (void)setObject:(NSString *)value forKey:(NSString *)defaultName {
    [[PDKeychainBindingsController sharedKeychainBindingsController] setValue:value forKeyPath:[NSString stringWithFormat:@"values.%@",defaultName]];
}

- (void)setString:(NSString *)value forKey:(NSString *)defaultName {
    [[PDKeychainBindingsController sharedKeychainBindingsController] setValue:value forKeyPath:[NSString stringWithFormat:@"values.%@",defaultName]];
}

- (void)removeObjectForKey:(NSString *)defaultName {
    [[PDKeychainBindingsController sharedKeychainBindingsController] setValue:nil forKeyPath:[NSString stringWithFormat:@"values.%@",defaultName]];
}

- (NSString *)stringForKey:(NSString *)defaultName {
    return (NSString *) [self objectForKey:defaultName];
}

@end

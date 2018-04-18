//
//  DeviceInfo.m
//  DVIA - Damn Vulnerable iOS App (damnvulnerableiosapp.com)
//  Created by Prateek Gianchandani on 23/03/18. 23/03/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//  You are free to use this app for commercial or non-commercial purposes
//  You are also allowed to use this in trainings
//  However, if you benefit from this project and want to make a contribution, please consider making a donation to The Juniper Fund (www.thejuniperfund.org/)
//  The Juniper fund is focusing on Nepali workers involved with climbing and expedition support in the high mountains of Nepal. When a high altitude worker has an accident (death or debilitating injury), the impact to the family is huge. The juniper fund provides funds to the affected families and help them set up a sustainable business.
//  For more information,  visit www.thejuniperfund.org
//  Or watch this video https://www.youtube.com/watch?v=HsV6jaA5J2I
//  And this https://www.youtube.com/watch?v=6dHXcoF590E
 

#import <Foundation/Foundation.h>
#import "DeviceInfo.h"
#import <mach/mach.h>
#include <sys/sysctl.h>
#include <sys/types.h>
#include <mach/processor_info.h>
#include <mach/mach_host.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#import <dlfcn.h>
#import <sys/types.h>
#import <sys/stat.h>
#import <mach-o/dyld.h>
#include <sys/sysctl.h>
#include <sys/utsname.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#include <libgen.h>
#include <mach/processor_info.h>
#import <SystemConfiguration/CaptiveNetwork.h>


// ...
@implementation DeviceInfo : NSObject

+(NSString *)getDeviceInfo{
    
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(),
                                   TASK_BASIC_INFO,
                                   (task_info_t)&info,
                                   &size);
    if( kerr == KERN_SUCCESS ) {
        
        NSLog(@"Memory in use (in MB): %f", ((CGFloat)info.resident_size / 1000000));
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kerr));
    }
    
    size_t sizet = 32;
    char build_id[sizet];
    memset(build_id, 0, sizet);
    int err = sysctlbyname("kern.osversion", build_id, &sizet, NULL, 0);
    if (err == -1) {
        printf("failed to detect version (sysctlbyname failed\n");
    }
    printf("build_id: %s\n", build_id);
    
    struct utsname u = {0};
    uname(&u);
    
    //Get the Wifi information
    
    NSArray *interFaceNames = (__bridge_transfer id)CNCopySupportedInterfaces();
    
    for (NSString *name in interFaceNames) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)name);
        
        NSLog(@"wifi info: bssid: %@, ssid:%@, ssidData: %@", info[@"BSSID"], info[@"SSID"], info[@"SSIDDATA"]);
    }
    return [NSString stringWithFormat:@"Sysname: %s\nNodename: %s\nRelease: %s\nVersion: %s\nMachine: %s\nMemory in use (in MB): %f\nPID: %d\n", u.sysname,u.nodename,u.release,u.version,u.machine,((CGFloat)info.resident_size / 1000000),getpid()];

}

@end

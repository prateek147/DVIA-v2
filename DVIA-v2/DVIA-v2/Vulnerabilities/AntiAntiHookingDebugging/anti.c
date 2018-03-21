//
//  anti.c
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 3/21/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

#include "anti.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#import <dlfcn.h>
#import <sys/types.h>
#import <sys/stat.h>
#import <mach-o/dyld.h>

typedef int (*ptrace_ptr_t)(int _request, pid_t _pid, caddr_t _addr, int _data);
#if !defined(PT_DENY_ATTACH)
#define PT_DENY_ATTACH 31
#endif  // !defined(PT_DENY_ATTACH)


void disable_gdb()
{
    void* handle = dlopen(0, RTLD_GLOBAL | RTLD_NOW);
    ptrace_ptr_t ptrace_ptr = dlsym(handle, "ptrace");
    ptrace_ptr(PT_DENY_ATTACH, 0, 0, 0);
    dlclose(handle);
}

bool detect_injected_dylds()
{
    //Get count of all currently loaded DYLD
    uint32_t count = _dyld_image_count();
    for(uint32_t i = 0; i < count; i++)
    {
        //Name of image (includes full path)
        const char *dyld = _dyld_get_image_name(i);
        if(!strstr(dyld, "MobileSubstrate") || !strstr(dyld, "cycript") || !strstr(dyld, "SSLKillSwitch2")) {
            continue;
        }
        else {
            exit(0);
        }
    }
    return false;
}

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
#include <sys/sysctl.h>
#include <sys/utsname.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#include <libgen.h>
#include <mach/processor_info.h>

typedef int (*ptrace_ptr_t)(int _request, pid_t _pid, caddr_t _addr, int _data);
#if !defined(PT_DENY_ATTACH)
#define PT_DENY_ATTACH 31
#endif  // !defined(PT_DENY_ATTACH)
processor_info_array_t cpuInfo, prevCpuInfo;
mach_msg_type_number_t numCpuInfo, numPrevCpuInfo;
unsigned numCPUs;


void disable_gdb()
{
    void* handle = dlopen(0, RTLD_GLOBAL | RTLD_NOW);
    ptrace_ptr_t ptrace_ptr = dlsym(handle, "ptrace");
    ptrace_ptr(PT_DENY_ATTACH, 0, 0, 0);
    dlclose(handle);
}

int detect_injected_dylds()
{
    
    //Get count of all currently loaded DYLD
    uint32_t count = _dyld_image_count();
    for(uint32_t i = 0; i < count; i++)
    {
        //Name of image (includes full path)
        const char *dyld = _dyld_get_image_name(i);
       // printf("Injected Library:%s\n",basename(dyld));
        if(!strstr(dyld, "MobileSubstrate") || !strstr(dyld, "cycript") || !strstr(dyld, "SSLKillSwitch2")) {
            continue;
        }
        else {
            exit(0);
        }
        
        
        
    }
    
    int mib[2U] = { CTL_HW, HW_NCPU };
    size_t sizeOfNumCPUs = sizeof(numCPUs);
    int status = sysctl(mib, 2U, &numCPUs, &sizeOfNumCPUs, NULL, 0U);
    if(status)
        numCPUs = 1;
    
    return 0;
}


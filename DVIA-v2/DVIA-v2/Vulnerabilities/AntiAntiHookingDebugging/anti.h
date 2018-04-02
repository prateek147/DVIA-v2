//
//  anti.h
//  DVIA-v2
//
//  Created by Prateek Gianchandani on 3/21/18.
//  Copyright © 2018 HighAltitudeHacks. All rights reserved.
//

#ifndef anti_h
#define anti_h

#include <stdio.h>

inline int detect_injected_dylds(void) __attribute__((always_inline));;
inline void disable_gdb(void) __attribute__((always_inline));;
inline int isDebugged (void) __attribute__((always_inline));

#endif

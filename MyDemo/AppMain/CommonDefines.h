//
//  CommonDefines.h
//  MyDemo
//
//  Created by chuange.lcg on 16/4/14.
//  Copyright © 2016年 lcg. All rights reserved.
//

#ifndef CommonDefines_h
#define CommonDefines_h

//常用变量
#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

#endif /* CommonDefines_h */

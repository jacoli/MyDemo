//
//  UrlRouter.h
//  MyDemo
//
//  Created by chuange.lcg on 16/3/29.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SINGLETON_DECLARE() + (instancetype)sharedInstance;

#define SINGLETON_IMPL(cls) + (instancetype)sharedInstance { \
static cls *__sharedInstance; \
static dispatch_once_t __once; \
dispatch_once(&__once, ^{ \
__sharedInstance = [[cls alloc] init]; \
}); \
\
return __sharedInstance; \
} \

@interface UrlRouter : NSObject

SINGLETON_DECLARE()

- (UIViewController *)viewControllerCreatedForUrl:(NSURL *)url;

@end

//
//  UrlRouter.m
//  MyDemo
//
//  Created by chuange.lcg on 16/3/29.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "UrlRouter.h"
#import "H5ContainerViewController.h"

@interface UrlRouter ()

@property (nonatomic, strong) NSMutableDictionary *url2ClsMap;

@end

@implementation UrlRouter

SINGLETON_IMPL(UrlRouter)

- (NSMutableDictionary *)url2ClsMap {
    if (!_url2ClsMap) {
        _url2ClsMap = [[NSMutableDictionary alloc] init];
        _url2ClsMap[@"local://afn"] = @"AFNViewController";
        _url2ClsMap[@"local://tools"] = @"ToolsViewController";
    }
    
    return _url2ClsMap;
}

- (UIViewController *)viewControllerCreatedForUrl:(NSURL *)url {
    if (!url) {
        return nil;
    }
    
    NSString *scheme = url.scheme;
    
    if ([scheme isEqualToString:@"http"]) {
        H5ContainerViewController *vc = [[H5ContainerViewController alloc] init];
        vc.url = url;
        return vc;
    }
    else if ([scheme isEqualToString:@"local"]) {
        NSString *urlStr = url.absoluteString;
        NSString *clsName = self.url2ClsMap[urlStr];
        Class cls = NSClassFromString(clsName);
        if (cls && ([cls isSubclassOfClass:[UIViewController class]] || cls == UIViewController.class)) {
            return [[cls alloc] init];
        }
    }

    return nil;
}

@end

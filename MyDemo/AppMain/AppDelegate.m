//
//  AppDelegate.m
//  MyDemo
//
//  Created by chuange.lcg on 16/3/20.
//  Copyright © 2016年 lcg. All rights reserved.
//

#import "AppDelegate.h"
#import "MobClick.h"

#import "Routable.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)routerConfig {
    [[Routable sharedRouter] map:@"login" toController:[UIViewController class]];
    [[Routable sharedRouter]setNavigationController:(UINavigationController *)self.window.rootViewController];
    
    [[Routable sharedRouter] map:@"afn" toController:NSClassFromString(@"AFNViewController")];
    [[Routable sharedRouter] map:@"map" toController:NSClassFromString(@"MapViewController")];
    [[Routable sharedRouter] map:@"blur" toController:NSClassFromString(@"BlurViewController")];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MobClick startWithAppkey:@"570e06b4e0f55a704e00256e" reportPolicy:BATCH channelId:@"local_build"];
    [MobClick setLogEnabled:YES];
    
    Class cls = NSClassFromString(@"UMANUtil");
    SEL deviceIDSelector = @selector(openUDIDString);
    NSString *deviceID = nil;
    if(cls && [cls respondsToSelector:deviceIDSelector]){
        deviceID = [cls performSelector:deviceIDSelector];
    }
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:@{@"oid" : deviceID}
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    
    NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    
    [self routerConfig];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

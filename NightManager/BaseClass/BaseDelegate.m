//
//  BaseDelegate.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "BaseDelegate.h"
#import "BaseTabBarController.h"

@implementation BaseDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    BaseTabBarController *baseTabVC = [[BaseTabBarController alloc] init];
    
    [self.window setRootViewController:baseTabVC];
    [self.window makeKeyAndVisible];
    
    
    // Override point for customization after application launch.
    return YES;
}

@end

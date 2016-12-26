//
//  NightVersionManager.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "NightVersionManager.h"


NSString *const NightVersionNightFallingNotification = @"NightVersionNightFallingNotification";
NSString *const NightVersionDawnComingNotification = @"NightVersionDawnComingNotification";

CGFloat const NightVersionAnimationDuration = 0;

@interface NightVersionManager ()
@property (nonatomic, assign) ThemeVersion themeVersion;

@end

@implementation NightVersionManager

+ (NightVersionManager *)sharedNightVersionManager {
    static dispatch_once_t once;
    static NightVersionManager *instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

+ (void)nightFalling {
    self.sharedNightVersionManager.themeVersion = ThemeVersionNight;
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

+ (void)dawnComing {
    self.sharedNightVersionManager.themeVersion = ThemeVersionNormal;
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

+ (ThemeVersion)currentThemeVersion {
    return self.sharedNightVersionManager.themeVersion;
}

- (void)setThemeVersion:(ThemeVersion)themeVersion {
    if (_themeVersion == themeVersion) {
        // if type does not change, don't execute code below to enhance performance.
        return;
    }
    _themeVersion = themeVersion;
    if (themeVersion == ThemeVersionNight) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NightVersionNightFallingNotification object:nil];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:NightVersionDawnComingNotification object:nil];
    }
}
@end

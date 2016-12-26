//
//  NightVersionManager.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ThemeVersion) {
    ThemeVersionNormal,
    ThemeVersionNight
};

extern NSString *const NightVersionNightFallingNotification;
extern NSString *const NightVersionDawnComingNotification;

extern CGFloat const NightVersionAnimationDuration;

@interface NightVersionManager : NSObject

+ (ThemeVersion)currentThemeVersion;

+ (void)nightFalling;
+ (void)dawnComing;


@end

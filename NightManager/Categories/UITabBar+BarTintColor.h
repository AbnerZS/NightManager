//
//  UITabBar+BarTintColor.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (BarTintColor)

/**
 * Set this property when switch to night version uitabbar BarTintColor turns to this color.
 */
@property (nonatomic, strong) UIColor *nightBarTintColor;

/**
 *  UITabBar BarTintColor in normal version.
 */
@property (nonatomic, strong) UIColor *normalBarTintColor;

@end

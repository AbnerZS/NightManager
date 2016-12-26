//
//  UINavigationBar+BarTintColor.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (BarTintColor)

/**
 * Set this property when switch to night version uinavigationbar BarTintColor turns to this color.
 */
@property (nonatomic, strong) UIColor *nightBarTintColor;

/**
 *  UINavigationBar BarTintColor in normal version.
 */
@property (nonatomic, strong) UIColor *normalBarTintColor;

@end

//
//  UINavigationBar+TintColor.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (TintColor)

/**
 * Set this property when switch to night version uinavigationbar TintColor turns to this color.
 */
@property (nonatomic, strong) UIColor *nightTintColor;

/**
 *  UINavigationBar TintColor in normal version.
 */
@property (nonatomic, strong) UIColor *normalTintColor;

@end

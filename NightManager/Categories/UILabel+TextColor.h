//
//  UILabel+TextColor.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TextColor)

/**
 * Set this property when switch to night version uilabel TextColor turns to this color.
 */
@property (nonatomic, strong) UIColor *nightTextColor;

/**
 *  UILabel TextColor in normal version.
 */
@property (nonatomic, strong) UIColor *normalTextColor;

@end

//
//  UIButton+TitleColor.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TitleColor)

/**
 * Set this property when switch to night version uibutton TitleColor turns to this color.
 */
@property (nonatomic, strong) UIColor *nightTitleColor;

/**
 *  UIButton TitleColor in normal version.
 */
@property (nonatomic, strong) UIColor *normalTitleColor;

- (void)setNormalTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setNightTitleColor:(UIColor *)color forState:(UIControlState)state;

@end

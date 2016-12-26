//
//  UIButton+TitleColor.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "UIButton+TitleColor.h"

@implementation UIButton (TitleColor)

- (UIColor *)nightTitleColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTitleColor));
    if (nightColor) {
        return nightColor;
    } else if (self.normalTitleColor) {
        return self.normalTitleColor;
    } else {
        return self.currentTitleColor;
    }
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor forState:(UIControlState)state {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNormal) {
        [self setTitleColor:normalTitleColor forState:state];
    } else {
        [self setTitleColor:self.nightTitleColor forState:state];
    }
    objc_setAssociatedObject(self, @selector(normalTitleColor), normalTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setNightTitleColor:(UIColor *)color forState:(UIControlState)state {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        if (!self.normalTitleColor) {
            self.normalTitleColor = self.currentTitleColor;
        }
        [self setTitleColor:color forState:state];
    } else {
        [self setTitleColor:self.normalTitleColor forState:state];
    }
    objc_setAssociatedObject(self, @selector(color), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setNightTitleColor:(UIColor *)nightTitleColor {
    [self setNightTitleColor:nightTitleColor forState:UIControlStateNormal];
}

- (UIColor *)normalTitleColor {
    return objc_getAssociatedObject(self, @selector(normalTitleColor));
}

- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    [self setNormalTitleColor:normalTitleColor forState:UIControlStateNormal];
}





@end

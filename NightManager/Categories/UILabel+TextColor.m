//
//  UILabel+TextColor.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "UILabel+TextColor.h"
#import <objc/runtime.h>

@implementation UILabel (TextColor)

- (UIColor *)nightTextColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTextColor));
    if (nightColor) {
        return nightColor;
    } else if (self.normalTextColor) {
        return self.normalTextColor;
    } else {
        return self.textColor;
    }
}

- (void)setNightTextColor:(UIColor *)nightTextColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        if (!self.normalTextColor) {
            self.normalTextColor = self.textColor;
        }
        [self setTextColor:nightTextColor];
    } else {
        [self setTextColor:self.normalTextColor];
    }
    objc_setAssociatedObject(self, @selector(nightTextColor), nightTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTextColor {
    return objc_getAssociatedObject(self, @selector(normalTextColor));
}

- (void)setNormalTextColor:(UIColor *)normalTextColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNormal) {
        [self setTextColor:normalTextColor];
    } else {
        [self setTextColor:self.nightTextColor];
    }
    objc_setAssociatedObject(self, @selector(normalTextColor), normalTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

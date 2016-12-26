//
//  UINavigationBar+TintColor.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "UINavigationBar+TintColor.h"

@implementation UINavigationBar (TintColor)

- (UIColor *)nightTintColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTintColor));
    if (nightColor) {
        return nightColor;
    } else if (self.normalTintColor) {
        return self.normalTintColor;
    } else {
        return self.tintColor;
    }
}

- (void)setNightTintColor:(UIColor *)nightTintColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        if (!self.normalTintColor) {
            self.normalTintColor = self.tintColor;
        }
        [self setTintColor:nightTintColor];
    } else {
        [self setTintColor:self.normalTintColor];
    }
    objc_setAssociatedObject(self, @selector(nightTintColor), nightTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTintColor {
    return objc_getAssociatedObject(self, @selector(normalTintColor));
}

- (void)setNormalTintColor:(UIColor *)normalTintColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNormal) {
        [self setTintColor:normalTintColor];
    } else {
        [self setTintColor:self.nightTintColor];
    }
    objc_setAssociatedObject(self, @selector(normalTintColor), normalTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

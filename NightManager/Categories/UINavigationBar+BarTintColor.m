//
//  UINavigationBar+BarTintColor.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "UINavigationBar+BarTintColor.h"

@implementation UINavigationBar (BarTintColor)

- (UIColor *)nightBarTintColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightBarTintColor));
    if (nightColor) {
        return nightColor;
    } else if (self.normalBarTintColor) {
        return self.normalBarTintColor;
    } else {
        return self.barTintColor;
    }
}

- (void)setNightBarTintColor:(UIColor *)nightBarTintColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        if (!self.normalBarTintColor) {
            self.normalBarTintColor = self.barTintColor;
        }
        [self setBarTintColor:nightBarTintColor];
    } else {
        [self setBarTintColor:self.normalBarTintColor];
    }
    objc_setAssociatedObject(self, @selector(nightBarTintColor), nightBarTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalBarTintColor {
    return objc_getAssociatedObject(self, @selector(normalBarTintColor));
}

- (void)setNormalBarTintColor:(UIColor *)normalBarTintColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNormal) {
        [self setBarTintColor:normalBarTintColor];
    } else {
        [self setBarTintColor:self.nightBarTintColor];
    }
    objc_setAssociatedObject(self, @selector(normalBarTintColor), normalBarTintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

//
//  UIView+BackgroundColor.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "UIView+BackgroundColor.h"

@implementation UIView (BackgroundColor)

- (UIColor *)nightBackgroundColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightBackgroundColor));
    if (nightColor) {
        return nightColor;
    } else if (self.normalBackgroundColor) {
        return self.normalBackgroundColor;
    } else {
        return self.backgroundColor;
    }
}

- (void)setNightBackgroundColor:(UIColor *)nightBackgroundColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        if (!self.normalBackgroundColor) {
            self.normalBackgroundColor = self.backgroundColor;
        }
        [self setBackgroundColor:nightBackgroundColor];
    } else {
        [self setBackgroundColor:self.normalBackgroundColor];
    }
    objc_setAssociatedObject(self, @selector(nightBackgroundColor), nightBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalBackgroundColor {
    return objc_getAssociatedObject(self, @selector(normalBackgroundColor));
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNormal) {
        [self setBackgroundColor:normalBackgroundColor];
    } else {
        [self setBackgroundColor:self.nightBackgroundColor];
    }
    objc_setAssociatedObject(self, @selector(normalBackgroundColor), normalBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

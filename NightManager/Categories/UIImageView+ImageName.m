//
//  UIImageView+ImageName.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/27.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "UIImageView+ImageName.h"

@implementation UIImageView (ImageName)

- (UIImage *)nightWithImage {
    UIImage *nightImage = objc_getAssociatedObject(self, @selector(nightWithImage));
    if (nightImage) {
        return nightImage;
    } else if (self.normalWithImage) {
        return self.normalWithImage;
    } else {
        return self.image;
    }
}

- (void)setNightWithImage:(UIImage *)nightWithImage {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        if (!self.normalWithImage) {
            self.normalWithImage = self.image;
        }
        [self setImage:nightWithImage];
    } else {
        [self setImage:self.normalWithImage];
    }
    objc_setAssociatedObject(self, @selector(nightWithImage), nightWithImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)normalWithImage {
    return objc_getAssociatedObject(self, @selector(normalWithImage));
}

- (void)setNormalWithImage:(UIImage *)normalWithImage {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNormal) {
        [self setImage:normalWithImage];
    } else {
        [self setImage:self.nightWithImage];
    }
    objc_setAssociatedObject(self, @selector(normalWithImage), normalWithImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}




@end

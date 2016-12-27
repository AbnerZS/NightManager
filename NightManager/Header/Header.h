//
//  Header.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import "NightVersionManager.h"
#import <objc/runtime.h>
#import "NSObject+Night.h"
#import "UILabel+TextColor.h"
#import "UIButton+TitleColor.h" 
#import "UIView+BackgroundColor.h"
#import "UIImageView+ImageName.h"

#import "UINavigationBar+BarTintColor.h"
#import "UINavigationBar+TintColor.h"

#import "UITabBar+BarTintColor.h"


#define kThemeColor    [UIColor colorWithRed:(96)/255.0 green:(219)/255.0 blue:(243)/255.0 alpha:1.0]

#define kScreenWidth ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)

#define kScreenHeight ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)


#endif /* Header_h */

//
//  NSObject+Night.h
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^NightVersionColorChangedBlock)(void);

@interface NSObject (Night)
- (void)addColorChangedBlock:(NightVersionColorChangedBlock)block;

@end

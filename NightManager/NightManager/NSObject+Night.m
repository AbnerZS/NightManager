//
//  NSObject+Night.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "NSObject+Night.h"

@interface NSObject ()

@property (nonatomic, strong) NSMutableArray<NightVersionColorChangedBlock> *blocks;

@end

@implementation NSObject (Night)

- (void)nightUpdateColor {
    [self.blocks enumerateObjectsUsingBlock:^(NightVersionColorChangedBlock  _Nonnull block, NSUInteger idx, BOOL * _Nonnull stop) {
        [UIView animateWithDuration:NightVersionAnimationDuration
                         animations:block];
    }];
}

- (void)addColorChangedBlock:(NightVersionColorChangedBlock)block {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nightUpdateColor) name:NightVersionNightFallingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nightUpdateColor) name:NightVersionDawnComingNotification object:nil];
    [self.blocks addObject:[block copy]];
    block();
}

- (NSMutableArray<NightVersionColorChangedBlock> *)blocks {
    NSMutableArray<NightVersionColorChangedBlock> *blocks = objc_getAssociatedObject(self, @selector(blocks));
    if (!blocks) {
        blocks = [[NSMutableArray alloc] init];
        objc_setAssociatedObject(self, @selector(blocks), blocks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return blocks;
}

- (void)setBlocks:(NSMutableArray<NightVersionColorChangedBlock> *)blocks {
    objc_setAssociatedObject(self, @selector(blocks), blocks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (blocks == nil) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:NightVersionNightFallingNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:NightVersionDawnComingNotification object:nil];
    }
}


@end

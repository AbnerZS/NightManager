//
//  BaseNavigationController.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        return UIStatusBarStyleLightContent;
        
    } else {
        return UIStatusBarStyleDefault;

    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(&*self)weakSelf = self;
    // 对NavigationBar颜色的设置
    [self addColorChangedBlock:^{
        weakSelf.navigationBar.nightBarTintColor = [UIColor blackColor];
        weakSelf.navigationBar.normalBarTintColor = kThemeColor;
    }];
    // 对NavigationBar上文字颜色的设置
    [self addColorChangedBlock:^{
        weakSelf.navigationBar.normalTintColor = [UIColor blackColor];
        weakSelf.navigationBar.nightTintColor = [UIColor whiteColor];

    }];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

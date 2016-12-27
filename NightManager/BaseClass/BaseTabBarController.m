//
//  BaseTabBarController.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "MeViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarItems];
    self.tabBar.translucent = NO;
    // Do any additional setup after loading the view.
}


- (void)setupTabBarItems {    
    BaseViewController *baseVC = [[BaseViewController alloc] init];
    BaseNavigationController *baseNC = [[BaseNavigationController alloc] initWithRootViewController:baseVC];
    baseNC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_news"] selectedImage:nil];
    
    MeViewController *VC = [[MeViewController alloc] init];
    BaseNavigationController *NC = [[BaseNavigationController alloc] initWithRootViewController:VC];
    NC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"tab_me"] selectedImage:nil];
    
    self.viewControllers = @[baseNC, NC];
    self.tabBar.tintColor = kThemeColor;
    
    __weak typeof(&*self)weakSelf = self;
    // 对tabBar颜色的设置
    [self addColorChangedBlock:^{
        weakSelf.tabBar.nightBarTintColor = [UIColor blackColor];
        weakSelf.tabBar.normalBarTintColor = [UIColor whiteColor];
    }];
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

//
//  BaseViewController.m
//  NightManager
//
//  Created by abnerzhang on 2016/12/26.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "BaseViewController.h"
#import "UIButton+TitleColor.h"

@interface BaseViewController ()

@property (nonatomic, strong) UILabel *changeLabel;
@property (nonatomic, strong) UIButton *changeBtn;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.changeLabel];
    [self.view addSubview:self.changeBtn];
    
    __weak typeof(&*self)weakSelf = self;
    [self addColorChangedBlock:^{
        weakSelf.changeLabel.normalTextColor = [UIColor blackColor];
        weakSelf.changeLabel.nightTextColor = [UIColor cyanColor];
        weakSelf.changeLabel.normalBackgroundColor = [UIColor redColor];
        weakSelf.changeLabel.nightBackgroundColor = [UIColor whiteColor];
        
    }];
    
    [self addColorChangedBlock:^{
        [weakSelf.changeBtn setNormalTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weakSelf.changeBtn setNightTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        weakSelf.changeBtn.normalBackgroundColor = [UIColor redColor];
        weakSelf.changeBtn.nightBackgroundColor = [UIColor whiteColor];
    }];
    
    [self addColorChangedBlock:^{
        weakSelf.view.normalBackgroundColor = [UIColor whiteColor];
        weakSelf.view.nightBackgroundColor = [UIColor grayColor];
    }];
        
    
    UISwitch *switchHandler = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:switchHandler];
    [switchHandler addTarget:self action:@selector(changeLight) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我的" style:UIBarButtonItemStyleDone target:self action:@selector(leftClick)];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)leftClick {
    
}

-(void)changeLight{
    if ([NightVersionManager currentThemeVersion] == ThemeVersionNight) {
        [NightVersionManager dawnComing];
    } else {
        [NightVersionManager nightFalling];
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UILabel *)changeLabel {
    if (!_changeLabel) {
        _changeLabel = [UILabel new];
        _changeLabel.frame = CGRectMake(0, 0, 200, 30);
        _changeLabel.textAlignment = NSTextAlignmentCenter;
        _changeLabel.text = @"这是一个UILabel";
    }
    return _changeLabel;
}

- (UIButton *)changeBtn {
    if (!_changeBtn) {
        _changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _changeBtn.frame = CGRectMake(0, 50, 200, 30);
        [_changeBtn setTitle:@"这是一个UIButton" forState:UIControlStateNormal];
    }
    return _changeBtn;
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

//
//  ZHYNavController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYNavController.h"

@interface ZHYNavController () <UIGestureRecognizerDelegate>

/** 左上角返回按钮 */
@property (weak, nonatomic) UIButton * backButton;

@end

@implementation ZHYNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigation];
}

- (void)setupNavigation {

    self.interactivePopGestureRecognizer.delegate = self;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (self.childViewControllers.count >= 1) {
        
        [self setupNavPopButton];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setupNavPopButton {

    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    NSAttributedString *normalAttrsString = [[NSAttributedString alloc] initWithString:@"返回" attributes:normalAttrs];
    NSAttributedString *selectedAttrsString = [[NSAttributedString alloc] initWithString:@"返回" attributes:selectedAttrs];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setAttributedTitle:normalAttrsString forState:UIControlStateNormal];
    [backButton setAttributedTitle:selectedAttrsString forState:UIControlStateHighlighted];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [backButton sizeToFit];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [self.view addSubview:backButton];
    self.backButton = backButton;
}

- (void)backButtonClick {
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return self.childViewControllers.count > 1;
}

@end

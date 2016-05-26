//
//  ZHYMainTabbarController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMainTabbarController.h"
#import "ZHYEssenceController.h"
#import "ZHYNewViewController.h"
#import "ZHYFriendTrendsController.h"
#import "ZHYMeController.h"
#import "ZHYPublishViewController.h"
#import "ZHYNavController.h"
#import "ZHYTabbar.h"

@interface ZHYMainTabbarController ()

@end

@implementation ZHYMainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTabbarItem];
    [self setupChildViewControllers];
    [self setupTabBar];
}

- (void)setupChildViewControllers {

    [self setupChildVc:[[ZHYEssenceController alloc] init] image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon" title:@"精华"];
    [self setupChildVc:[[ZHYNewViewController alloc] init] image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon" title:@"新帖"];
    [self setupChildVc:[[ZHYFriendTrendsController alloc] init] image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon" title:@"关注"];
    [self setupChildVc:[[ZHYMeController alloc] initWithStyle:UITableViewStyleGrouped] image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon" title:@"我"];
    
}

- (void)setupTabBar {

    [self setValue:[[ZHYTabbar alloc] init] forKey:@"tabBar"];

}

- (void)setupChildVc:(UIViewController *)vc image:(NSString *)image selectImage:(NSString *)selectImage title:(NSString *)title{

    ZHYNavController * navVc = [[ZHYNavController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
    
    navVc.tabBarItem.title = title;
    navVc.tabBarItem.image = [UIImage imageNamed:image];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];

}

- (void)setupTabbarItem {
    
    // UIControlStateNormal状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 文字大小
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    // UIControlStateSelected状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem * item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}
@end

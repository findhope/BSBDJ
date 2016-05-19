//
//  ZHYTabbar.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTabbar.h"

@interface ZHYTabbar ()

/** 发布按钮 */
@property (weak, nonatomic) UIButton * publishButton;

@end

@implementation ZHYTabbar

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton sizeToFit];
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        self.publishButton = publishButton;
        
    }
    
    return self;
}

- (void)publishButtonClick {

    ZHYLogFunc;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    CGFloat width = self.k_Width;
    CGFloat height = self.k_Height;
    
    self.publishButton.center = CGPointMake(width *0.5, height * 0.5);
    
    int index = 0;
    
    CGFloat tabBarButtonW = width / 5;
    CGFloat tabBarButtonH = height;
    
    for (UIView *tabBarItem in self.subviews) {
        if (![NSStringFromClass(tabBarItem.class) isEqualToString:@"UITabBarButton"]) {
            continue;
        }
        
        CGFloat tabBarButtonX = index *tabBarButtonW;
        if (index >= 2) {
            tabBarButtonX += tabBarButtonW;
        }
        
        tabBarItem.frame = CGRectMake(tabBarButtonX, 0, tabBarButtonW, tabBarButtonH);
        
        index ++;
    }

}

@end

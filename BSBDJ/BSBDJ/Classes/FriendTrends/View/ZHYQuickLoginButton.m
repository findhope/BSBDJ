//
//  ZHYQuickLoginButton.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYQuickLoginButton.h"

@implementation ZHYQuickLoginButton

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.imageView.k_X = 0;
    self.imageView.k_Y = 0;
    self.imageView.k_centerX = self.k_Width * 0.5;
    
    self.titleLabel.k_X = 0;
    self.titleLabel.k_Y = self.imageView.k_Height;
    self.titleLabel.k_Height = self.k_Height - self.titleLabel.k_Y;
    self.titleLabel.k_Width = self.k_Width;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}

@end

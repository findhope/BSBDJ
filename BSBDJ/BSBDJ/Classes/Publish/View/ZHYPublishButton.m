//
//  ZHYPublishButton.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/23.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYPublishButton.h"

@implementation ZHYPublishButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.k_Y = 0;
    self.imageView.k_centerX = self.k_Width * 0.5;
    
    self.titleLabel.k_Width = self.k_Width;
    self.titleLabel.k_Y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.k_X = 0;
    self.titleLabel.k_Height = self.k_Height - self.titleLabel.k_Y;

}
@end

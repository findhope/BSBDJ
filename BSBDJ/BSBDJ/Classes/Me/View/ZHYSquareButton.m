//
//  ZHYSquareButton.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSquareButton.h"
#import <UIButton+WebCache.h>
#import "ZHYMeSquare.h"

@implementation ZHYSquareButton

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    self.imageView.k_Width = self.k_Width *0.5;
    self.imageView.k_Height = self.imageView.k_Width;
    self.imageView.k_Y = 10;
    self.imageView.k_centerX = self.k_Width *0.5;
    
    self.titleLabel.k_Width = self.k_Width;
    self.titleLabel.k_Height = self.k_Height - CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.k_X = 0;
    self.titleLabel.k_Y = CGRectGetMaxY(self.imageView.frame);
}

- (void)setSquareModel:(ZHYMeSquare *)squareModel {

    _squareModel = squareModel;
    [self setTitle:squareModel.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:squareModel.icon] forState:UIControlStateNormal];


}
@end

//
//  ZHYTagCell.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTagCell.h"

@implementation ZHYTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setFrame:(CGRect)frame{

    frame.size.height -= 1;

    [super setFrame:frame];
}

@end

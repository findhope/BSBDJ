//
//  ZHYMeTableCell.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMeTableCell.h"

@implementation ZHYMeTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.imageView.k_X = ZHYCommonMargin;
    self.imageView.k_Y = (ZHYCommonMargin-1) *0.5;
    self.imageView.k_Height = self.contentView.k_Height - self.imageView.k_Y *2;
    self.imageView.k_Width = self.imageView.k_Height;
    self.textLabel.k_X = CGRectGetMaxX(self.imageView.frame) + ZHYCommonMargin;
}

@end

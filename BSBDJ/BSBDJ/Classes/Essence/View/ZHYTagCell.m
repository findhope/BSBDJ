//
//  ZHYTagCell.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTagCell.h"
#import "ZHYTagsModel.h"
#import <UIImageView+WebCache.h>

@interface ZHYTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageList;

@property (weak, nonatomic) IBOutlet UILabel *themeName;

@property (weak, nonatomic) IBOutlet UILabel *subNumber;


@end

@implementation ZHYTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setTagModel:(ZHYTagsModel *)tagModel {

    _tagModel = tagModel;
    [self.imageList sd_setImageWithURL:[NSURL URLWithString:tagModel.image_list] placeholderImage:[UIImage imageNamed:@"defaultTagIcon"]];
    self.themeName.text = tagModel.theme_name;
    if (tagModel.sub_number >= 10000) {
        self.subNumber.text = [NSString stringWithFormat:@"%.1f万人订阅", tagModel.sub_number/10000.0];
    } else {
    
        self.subNumber.text = [NSString stringWithFormat:@"%zd人订阅" ,tagModel.sub_number];
    }
    

}

- (void)setFrame:(CGRect)frame{

    frame.size.height -= 1;

    [super setFrame:frame];
}

@end

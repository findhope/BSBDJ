//
//  ZHYTagCell.h
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHYTagsModel;

@interface ZHYTagCell : UITableViewCell

/** 标签模型 */
@property (strong, nonatomic) ZHYTagsModel *tagModel;

@end

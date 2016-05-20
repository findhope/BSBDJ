//
//  ZHYTagsModel.h
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHYTagsModel : NSObject

/** 图片 */
@property (copy, nonatomic) NSString * image_list;
/** 名字 */
@property (copy, nonatomic) NSString * theme_name;
/** 订阅数 */
@property (assign, nonatomic) NSInteger sub_number;

@end

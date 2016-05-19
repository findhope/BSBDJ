//
//  UIBarButtonItem+ZHYExtension.h
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZHYExtension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end

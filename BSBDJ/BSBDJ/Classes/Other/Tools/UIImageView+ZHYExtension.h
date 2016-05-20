//
//  UIImageView+ZHYExtension.h
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZHYExtension)

/**
 * 设置圆形头像
 */
- (void)setCircleHeaderWithPlaceholderImage:(UIImage *)placeholderImage url:(NSString *)url;

/**
 * 设置圆角头像
 */
- (void)setHeaderWithPlaceholderImage:(UIImage *)placeholderImage CornerRadius:(CGFloat)cornerRadius url:(NSString *)url;

@end

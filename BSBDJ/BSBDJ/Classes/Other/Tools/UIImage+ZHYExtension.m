//
//  UIImage+ZHYExtension.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "UIImage+ZHYExtension.h"

@implementation UIImage (ZHYExtension)

- (instancetype)circleImage {

    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    // 获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 创建一个矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // 添加一个圆
    CGContextAddEllipseInRect(ctx, rect);
    // 裁剪此圆
    CGContextClip(ctx);
    // 往圆上画一张图片
    [self drawInRect:rect];
    // 获得上下文中的图片
    UIImage * circleImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    return circleImage;
}

- (instancetype)imageWithCornerRadius:(CGFloat)cornerRadius {
    
    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    // 创建一个矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    // 添加一个圆角矩形曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    // 裁剪此曲线区域
    [path addClip];
    // 往圆上画一张图片
    [self drawInRect:rect];
    // 获得上下文中的图片
    UIImage * cornerRadiusImage = UIGraphicsGetImageFromCurrentImageContext();
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return cornerRadiusImage;
}

+ (instancetype)circleImageNamed:(NSString *)name {

    return [[self imageNamed:name] circleImage];
}

+ (instancetype)imageWithImageNamed:(NSString *)name CornerRadius:(CGFloat)cornerRadius {

    return [[self imageNamed:name] imageWithCornerRadius:cornerRadius];
}

@end

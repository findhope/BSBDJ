//
//  UIImage+ZHYExtension.h
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZHYExtension)

- (instancetype)circleImage;

- (instancetype)imageWithCornerRadius:(CGFloat)cornerRadius;

+ (instancetype)circleImageNamed:(NSString *)name;

+ (instancetype)imageWithImageNamed:(NSString *)name CornerRadius:(CGFloat)cornerRadius;

@end

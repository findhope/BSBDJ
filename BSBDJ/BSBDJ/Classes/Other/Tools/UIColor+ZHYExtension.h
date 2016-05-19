//
//  UIColor+ZHYExtension.h
//  16Color
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZHYExtension)

+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;

//eg. self.window.backgroundColor = [UIColor colorWithHexValue:0x123456 alpha:0.8];

@end

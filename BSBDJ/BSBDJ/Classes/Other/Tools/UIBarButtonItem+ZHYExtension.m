//
//  UIBarButtonItem+ZHYExtension.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "UIBarButtonItem+ZHYExtension.h"

@implementation UIBarButtonItem (ZHYExtension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end

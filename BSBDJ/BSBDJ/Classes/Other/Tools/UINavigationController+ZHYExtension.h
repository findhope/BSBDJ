//
//  UINavigationController+ZHYExtension.h
//  16Color
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ZHY_FLIP_TRANSITION_DURATION 0.4

@interface UINavigationController (ZHYExtension)

- (void)pushViewController:(UIViewController*)controller animatedWithTransition:(UIViewAnimationTransition)transition;

- (UIViewController*)popViewControllerAnimatedWithTransition:(UIViewAnimationTransition)transition;

@end

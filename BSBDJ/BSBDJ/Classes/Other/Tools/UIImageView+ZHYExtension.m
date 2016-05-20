//
//  UIImageView+ZHYExtension.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/20.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "UIImageView+ZHYExtension.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (ZHYExtension)



- (void)setCircleHeaderWithPlaceholderImage:(UIImage *)placeholderImage url:(NSString *)url {

    ZHYWeakSelf;
    UIImage * placeHolder = [placeholderImage circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeHolder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 如果图片下载失败，就不做任何处理，按照默认的做法：会显示占位图片
        if (image == nil) return;
        
        weakSelf.image = [image circleImage];
    }];
}


- (void)setHeaderWithPlaceholderImage:(UIImage *)placeholderImage CornerRadius:(CGFloat)cornerRadius url:(NSString *)url {
    
    ZHYWeakSelf;
    UIImage * placeHolder = [placeholderImage imageWithCornerRadius:cornerRadius];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeHolder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        // 如果图片下载失败，就不做任何处理，按照默认的做法：会显示占位图片
        if (image == nil) return;
        
        weakSelf.image = [image imageWithCornerRadius:cornerRadius];
    }];

}

@end

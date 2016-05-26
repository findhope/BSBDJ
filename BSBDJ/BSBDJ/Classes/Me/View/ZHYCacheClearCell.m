//
//  ZHYCacheClearCell.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/23.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYCacheClearCell.h"
#import <SVProgressHUD.h>


@implementation ZHYCacheClearCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.textLabel.text = @"清除缓存";
        // 禁止点击事件
        self.userInteractionEnabled = NO;
        
        // 右边显示圈圈
        UIActivityIndicatorView * loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadView startAnimating];
        self.accessoryView = loadView;
        
        // 计算大小
        [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
            // 计算缓存大小
            NSUInteger cacheSize = ZHYCacheFile.fileSize;
            CGFloat unit = 1000.0;
            NSString *sizeText = nil;
            if (cacheSize >= unit * unit * unit) { // >= 1GB
                sizeText = [NSString stringWithFormat:@"%.1fGB",cacheSize / unit / unit / unit];
            } else if (cacheSize >= unit * unit) { // >= 1MB
                sizeText = [NSString stringWithFormat:@"%.1fMB",cacheSize / unit / unit];
            } else if (cacheSize >= unit) { // >= 1KB
                sizeText = [NSString stringWithFormat:@"%.1fKB",cacheSize / unit];
            } else { // >= 0B
                sizeText = [NSString stringWithFormat:@"%zdB",cacheSize];
            }
            NSString * text = [NSString stringWithFormat:@"%@ (%@)", @"清除缓存", sizeText];
            // 回到主线程
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.textLabel.text = text;
                self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                self.accessoryView = nil;
                // 允许点击事件
                self.userInteractionEnabled = YES;
                
            }];
        }];
    }
    return self;
}

- (void)updateStatus {
    if (self.accessoryView == nil) {
        return;
    }
    // 让圆圈继续旋转
    UIActivityIndicatorView * loadingView = (UIActivityIndicatorView *)self.accessoryView;
    [loadingView startAnimating];

}

- (void)clearCache {

    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:@"正在清除缓存"];
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        [[NSFileManager defaultManager] removeItemAtPath:ZHYCacheFile error:nil];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [SVProgressHUD showSuccessWithStatus:@"清除缓存成功"];
            self.textLabel.text = @"清除缓存";
            self.userInteractionEnabled = NO;
            [SVProgressHUD dismiss];
        }];
        
    }];

}

@end

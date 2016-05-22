//
//  ZHYMeFooterView.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/21.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMeFooterView.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "ZHYMeSquare.h"
#import "ZHYSquareButton.h"
#import "ZHYMeWebController.h"

@interface ZHYMeFooterView ()

@end

@implementation ZHYMeFooterView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
     
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"a"] = @"square";
        params[@"c"] = @"topic";
        params[@"appname"] = @"baisishequ";
        params[@"client"] = @"iphone";
        params[@"sex"] = @"m";
        params[@"device"] = @"ios";
        
        ZHYWeakSelf;
        [[AFHTTPSessionManager manager] GET:ZHYRequestURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf creatSquares:[ZHYMeSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]]];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }
    return self;
}

- (void)creatSquares:(NSArray *)squares {

    NSUInteger colsCount = 4;
    
    CGFloat buttonW = self.k_Width/colsCount;
    CGFloat buttonH = buttonW;
    NSUInteger squaresCount = squares.count;
    NSInteger indexCount = 0;
    for (NSInteger index = 0; index < squaresCount; index++) {
        
        ZHYMeSquare *square = squares[index];
        
        if (([square.iphone rangeOfString:@"4"].location == NSNotFound) || index == 16 || index == 21) {
            continue;
        } //此处判断是因为强迫症,实际不需要
        
        
        ZHYSquareButton * button = [ZHYSquareButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(squareButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        CGFloat buttonX = (indexCount % colsCount) *buttonW;
        CGFloat buttonY = (indexCount / colsCount) *buttonH;
        button.frame = CGRectMake(buttonX, buttonY, buttonW - 1, buttonH - 1);
        button.backgroundColor = [UIColor whiteColor];
        button.squareModel = squares[index];
        indexCount ++;
        
    }
    NSUInteger rowCount = (indexCount + colsCount - 1)/colsCount;
    self.k_Height = rowCount * buttonH;
    UITableView *superTableView = (UITableView *)self.superview;
    superTableView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));

}

- (void)squareButtonClick:(ZHYSquareButton *)button {

    if ([button.squareModel.url hasPrefix:@"http"]) {
        
        ZHYMeWebController *webVc = [[ZHYMeWebController alloc] init];
        webVc.squareModel = button.squareModel;
        UITabBarController *rootVc = (UITabBarController *)ZHYKeyWindow.rootViewController;
        UINavigationController *selectNavVc = (UINavigationController *)rootVc.selectedViewController;
        [selectNavVc pushViewController:webVc animated:YES];
        
    }

}
@end

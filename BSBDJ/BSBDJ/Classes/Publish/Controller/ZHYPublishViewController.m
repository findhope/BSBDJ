//
//  ZHYPublishViewController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYPublishViewController.h"
#import "ZHYPublishButton.h"
#import <POP.h>

@interface ZHYPublishViewController ()

/** 动画时间 */
@property (strong, nonatomic) NSArray *times;
/** buttons */
@property (strong, nonatomic) NSMutableArray *buttons;
/** slogan */
@property (weak, nonatomic) UIImageView * sloganView;

@end

@implementation ZHYPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupController];
    [self setupSloganView];
    [self setupButtons];
}

- (void)setupController {
    // 禁止交互
    self.view.userInteractionEnabled = NO;
    

}

- (NSArray *)times {
    if (!_times) {
        CGFloat insterval = 0.1;
        
        _times = @[@(5 * insterval),
                   @(6 * insterval),
                   @(3 * insterval),
                   @(2 * insterval),
                   @(2 * insterval),
                   @(4 * insterval),
                   @(1 * insterval)];
    }
    return _times;
}

- (NSMutableArray *)buttons {
    if (!_buttons) {
        
        _buttons = [NSMutableArray arrayWithCapacity:6];
    }
    return _buttons;
}

- (void)setupButtons {
    
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    // 参数
    NSUInteger count = images.count;
    int maxColsCount = 3; // 一行的列数
    NSUInteger rowsCount = (count + maxColsCount - 1) / maxColsCount;
    // 按钮尺寸
    CGFloat buttonW = ZHYScreenW / maxColsCount;
    CGFloat buttonH = buttonW;
    CGFloat buttonStartY = (ZHYScreenH - rowsCount * buttonH) * 0.5;
    
    for (int index = 0; index < count; index++) {
        // 创建、添加
        ZHYPublishButton *button = [ZHYPublishButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [self.buttons addObject:button];
        // frame
        CGFloat buttonX = (index % maxColsCount) * buttonW;
        CGFloat buttonY = buttonStartY + (index / maxColsCount) * buttonH;
        // 内容
        [button setImage:[UIImage imageNamed:images[index]] forState:UIControlStateNormal];
        [button setTitle:titles[index] forState:UIControlStateNormal];
        //  动画
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        anim.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY - ZHYScreenH, buttonW, buttonH)];
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonY, buttonW, buttonH)]; // 做动画之前不必再设置初始button frame
        anim.springSpeed = 18;
        anim.springBounciness = 18;
        // CACurrentMediaTime()获得的是当前时间
        anim.beginTime = CACurrentMediaTime() + [self.times[index] doubleValue];
        [button pop_addAnimation:anim forKey:nil];
        ZHYWeakSelf;
        [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
            weakSelf.view.userInteractionEnabled = YES;
        }];
    }
}

- (void)setupSloganView {

    CGFloat sloganY = ZHYScreenH * 0.15;
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    [self.view addSubview:sloganView];
    self.sloganView = sloganView;
    sloganView.k_Y = sloganY - ZHYScreenH;
    sloganView.k_centerX = ZHYScreenW * 0.5;
    
    POPSpringAnimation * anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(sloganY);
    anim.springSpeed = 18;
    anim.springBounciness = 18;
    // CACurrentMediaTime()获得的是当前时间
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [sloganView.layer pop_addAnimation:anim forKey:nil];

}

- (void)buttonClick:(ZHYPublishButton *)button {

    ZHYLogFunc;
}

- (IBAction)cancleButtonClick {
    self.view.userInteractionEnabled = NO;
    for (NSInteger index = 0; index < self.buttons.count; index++) {
        ZHYPublishButton * button = self.buttons[index];
        POPBasicAnimation * anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anim.toValue = @(button.layer.position.y + ZHYScreenH);
        anim.beginTime = CACurrentMediaTime() + [self.times[index] doubleValue];
        [button.layer pop_addAnimation:anim forKey:nil];
    }
    ZHYWeakSelf;
    // 让标题执行动画
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.toValue = @(self.sloganView.layer.position.y + ZHYScreenH);
    // CACurrentMediaTime()获得的是当前时间
    anim.beginTime = CACurrentMediaTime() + [self.times.lastObject doubleValue];
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        [weakSelf dismissViewControllerAnimated:NO completion:nil];
    }];
    [self.sloganView.layer pop_addAnimation:anim forKey:nil];
}


@end

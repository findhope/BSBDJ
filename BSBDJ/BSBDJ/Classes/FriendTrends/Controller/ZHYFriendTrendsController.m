//
//  ZHYFriendTrendsController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYFriendTrendsController.h"
#import "ZHYLoginRegisterController.h"

@interface ZHYFriendTrendsController ()

@end

@implementation ZHYFriendTrendsController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupController];
}

- (void)setupController {
    
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friednsRecommendClick)];
}

- (void)friednsRecommendClick {

    UITableViewController * frVc = [[UITableViewController alloc] init];
    [self.navigationController pushViewController:frVc animated:YES];
}

- (IBAction)LoginButtonClick {
    
    ZHYLoginRegisterController *lrVc = [[ZHYLoginRegisterController alloc] init];
    [self presentViewController:lrVc animated:YES completion:nil];
}

@end

//
//  ZHYEssenceController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYEssenceController.h"
#import "ZHYTagController.h"

@interface ZHYEssenceController ()

@end

@implementation ZHYEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavgationItem];
    
    
}

- (void)setupNavgationItem {

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(navLeftButtonClick)];
}

- (void)navLeftButtonClick {

    ZHYTagController *tagVc = [[ZHYTagController alloc] init];
    [self.navigationController pushViewController:tagVc animated:YES];
    
}
@end

//
//  ZHYMeController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMeController.h"
#import "ZHYSettingTableController.h"
#import "ZHYMeTableCell.h"
#import "ZHYMeFooterView.h"

@interface ZHYMeController ()

@end

@implementation ZHYMeController

static NSString * const ZHYMeCellID = @"ZHYME_CELL";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupController];
}

- (void)setupController {
    
    [self.tableView registerClass:[ZHYMeTableCell class] forCellReuseIdentifier:ZHYMeCellID];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    self.navigationItem.title = @"我的";
    self.view.backgroundColor = kCommonBgColor;
    
    UIBarButtonItem * moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonButtonClick)];
    UIBarButtonItem * settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    
    self.tableView.tableFooterView = [[ZHYMeFooterView alloc] init];
    
}

- (void)moonButtonClick {
    ZHYLogFunc;

}

- (void)settingButtonClick {
    
    ZHYSettingTableController * settingVc = [[ZHYSettingTableController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:settingVc animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ZHYMeTableCell * cell = [tableView dequeueReusableCellWithIdentifier:ZHYMeCellID];
    if (indexPath.section == 0) {
        cell.textLabel.text = @"登陆/注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    } else {
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = [UIImage imageNamed:@"iconDownLoad"];
    }
    return cell;
}

@end

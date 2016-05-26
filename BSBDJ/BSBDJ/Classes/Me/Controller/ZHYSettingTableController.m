//
//  ZHYSettingTableController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYSettingTableController.h"
#import "ZHYCacheClearCell.h"

@interface ZHYSettingTableController ()

@end

@implementation ZHYSettingTableController
static NSString * const ZHYSettingCellID = @"SETTING_CELL";
static NSString * const ZHYSettingClearCacheCellID = @"CACHE_CELL";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupController];

}

- (void)setupController {

    self.navigationItem.title = @"设置";
    self.view.backgroundColor = kCommonBgColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ZHYSettingCellID];
    [self.tableView registerClass:[ZHYCacheClearCell class] forCellReuseIdentifier:ZHYSettingClearCacheCellID];
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        ZHYCacheClearCell *cell = [tableView dequeueReusableCellWithIdentifier:ZHYSettingClearCacheCellID forIndexPath:indexPath];
        [cell updateStatus];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZHYSettingCellID forIndexPath:indexPath];
        return cell;
    }
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 清除缓存
    ZHYCacheClearCell * cell = (ZHYCacheClearCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell clearCache];
}

@end

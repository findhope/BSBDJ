//
//  ZHYTagController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTagController.h"
#import "ZHYTagCell.h"

@interface ZHYTagController ()

@end

@implementation ZHYTagController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupController];

}

- (void)setupController{

    self.navigationItem.title = @"推荐标签";
    self.view.backgroundColor = kCommonBgColor;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHYTagCell class]) bundle:nil] forCellReuseIdentifier:@"ZHY_TAGCELL"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 70;

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHYTagCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZHY_TAGCELL"];
    
    return cell;

}

@end

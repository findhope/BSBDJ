//
//  ZHYTagController.m
//  BSBDJ
//
//  Created by MitnickKevin on 16/5/19.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYTagController.h"
#import "ZHYTagCell.h"
#import "ZHYTagsModel.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import <MJExtension.h>

@interface ZHYTagController ()

/** Tags模型数组 */
@property (strong, nonatomic) NSArray *tags;

/** AFHTTPSessionManger */
@property (weak, nonatomic) AFHTTPSessionManager *manger;

@end

@implementation ZHYTagController

/** cell的循环利用标识 */
static NSString * const ZHYTagCellID = @"ZHY_TAGCELL";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupController];
    
    [self loadTags];

}

- (AFHTTPSessionManager *)manger{

    if (!_manger) {
        _manger = [AFHTTPSessionManager manager];
    }
    return _manger;
}

- (void)setupController{

    self.navigationItem.title = @"推荐标签";
    self.view.backgroundColor = kCommonBgColor;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZHYTagCell class]) bundle:nil] forCellReuseIdentifier:ZHYTagCellID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 70;
}

- (void)loadTags {

    [SVProgressHUD show];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    params[@"limit"] = @"50";
    
    ZHYWeakSelf;
    [self.manger GET:ZHYRequestURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject == nil) {
            
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
            return;
        }
        
        weakSelf.tags = [ZHYTagsModel mj_objectArrayWithKeyValuesArray:responseObject];
        
        [weakSelf.tableView reloadData];
        
        [SVProgressHUD dismiss];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == -999) {
            return;
        
        } else if (error.code == NSURLErrorTimedOut) {
            
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时,请稍后重试!"];
            
        } else {
        
            [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
        
        }
        
    }];
}

- (void)dealloc {

    [self.manger invalidateSessionCancelingTasks:YES];
    
    [SVProgressHUD dismiss];
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZHYTagCell * cell = [tableView dequeueReusableCellWithIdentifier:ZHYTagCellID];
    
    cell.tagModel = self.tags[indexPath.row];
    
    return cell;

}

@end

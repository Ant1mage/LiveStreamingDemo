//
//  AZBroadcastListController.m
//  LiveVideoDemo
//
//  Created by Alexander Zou on 2016/10/26.
//  Copyright © 2016年 Alexander Zou. All rights reserved.
//

#import "AZBroadcastListController.h"
#import "AZLiveViewController.h"
#import "AZLiveCell.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "AZLiveItem.h"
static NSString * const ID = @"cell";
@interface AZBroadcastListController ()
/** 直播 */
@property(nonatomic, strong) NSMutableArray *lives;

@end

@implementation AZBroadcastListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"直播列表";
    
    // 加载数据
    [self loadData];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"AZLiveCell" bundle:nil] forCellReuseIdentifier:ID];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)loadData
{
    // 映客数据url
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    // 请求数据
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    [mgr GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        
        _lives = [AZLiveItem mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lives.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AZLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.live = _lives[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AZLiveViewController *liveVc = [[AZLiveViewController alloc] init];
    liveVc.live = _lives[indexPath.row];
    
    [self presentViewController:liveVc animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 430;
}


@end

//
//  AZMainViewController.m
//  LiveVideoDemo
//
//  Created by Alexander Zou on 2016/10/26.
//  Copyright © 2016年 Alexander Zou. All rights reserved.
//

#import "AZMainViewController.h"
#import "AZBroadcastListController.h"
#import "AZPrepareViewController.h"
@interface AZMainViewController ()

@end

@implementation AZMainViewController
- (IBAction)caputureVideo:(id)sender {
    
    AZPrepareViewController *prepareVC = [[AZPrepareViewController alloc] init];
    [self.navigationController presentViewController:prepareVC animated:YES completion:nil];
    
}
- (IBAction)playVideo:(id)sender {
    
    AZBroadcastListController *broadcastVC = [[AZBroadcastListController alloc] init];
    [self.navigationController pushViewController:broadcastVC animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"直播";
}



@end

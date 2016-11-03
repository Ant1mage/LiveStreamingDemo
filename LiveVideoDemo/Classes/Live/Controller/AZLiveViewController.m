//
//  AZLiveViewController.m
//  LiveVideoDemo
//
//  Created by Alexander Zou on 2016/10/26.
//  Copyright © 2016年 Alexander Zou. All rights reserved.
//

#import "AZLiveViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "AZLiveItem.h"
#import "AZCreatorItem.h"
#import <UIImageView+WebCache.h>

@interface AZLiveViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IJKFFMoviePlayerController *player;
@end

@implementation AZLiveViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置直播占位图片
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",_live.creator.portrait]];
    [self.imageView sd_setImageWithURL:imageUrl placeholderImage:nil];
    
    // 拉流地址
    NSURL *url = [NSURL URLWithString:_live.stream_addr];
    
    // 创建IJKFFMoviePlayerController：传入拉流地址
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    
    // 准备播放
    [playerVc prepareToPlay];
    
    // 强引用，防止被销毁
    _player = playerVc;
    
    playerVc.view.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:playerVc.view atIndex:1];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 界面消失，停止播放
    [_player pause];
    [_player stop];
    [_player shutdown];
}


@end

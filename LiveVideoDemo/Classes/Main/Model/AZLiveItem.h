//
//  AZLiveItem.h
//  LiveVideoDemo
//
//  Created by Alexander Zou on 2016/10/26.
//  Copyright © 2016年 Alexander Zou. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AZCreatorItem;
@interface AZLiveItem : NSObject

/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 关注人 */
@property (nonatomic, assign) NSUInteger online_users;
/** 城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic, strong) AZCreatorItem *creator;
@end

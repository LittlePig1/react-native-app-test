//
//  NativeNotificationManager.h
//  cddyProducer
//
//  Created by 王金志 on 2019/3/26.
//  Copyright © 2019 aerozhonghuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeNotificationManager : NSObject
//类方法
+ (NativeNotificationManager *) shareNotification;
// 当前需要添加监听的名称
@property (nonatomic, copy, nullable) NSString *CurrentListenerName;
// 当前需要移除监听的名称
@property (nonatomic, copy, nullable) NSString *CurrentRemoveListenerName;
// 当前已经村在的监听
@property (nonatomic, strong, nullable) NSMutableArray *ListenerNameArr;

@end

NS_ASSUME_NONNULL_END

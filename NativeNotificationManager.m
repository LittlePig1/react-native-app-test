//
//  NativeNotificationManager.m
//  cddyProducer
//
//  Created by 王金志 on 2019/3/26.
//  Copyright © 2019 aerozhonghuan. All rights reserved.
//

#import "NativeNotificationManager.h"

@implementation NativeNotificationManager

static NativeNotificationManager *instance = nil;

+(NativeNotificationManager *) shareNotification{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

+(id) allocWithZone:(struct _NSZone*)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });    return instance;
}

- (NSMutableArray *)ListenerNameArr{
    if (!_ListenerNameArr) {
        _ListenerNameArr = [NSMutableArray array];
    }
    return _ListenerNameArr;
}
@end

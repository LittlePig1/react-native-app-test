
#import "RNAppTest.h"
#import <Foundation/Foundation.h>
#import "RNListenerManager.h"
#import "NativeNotificationManager.h"

@implementation RNAppTest

RCT_EXPORT_MODULE()

/**
 * 发送消息
 */
RCT_EXPORT_METHOD(notification:(NSString *)name notificationInfo:(NSDictionary *)info ) {
    if (info) {
        [RNListenerManager OCsendMessage:@{@"key":info[@"key"], @"info":info[@"info"], @"name":name}];
    } else {
        [RNListenerManager OCsendMessage:@{@"name":name}];
    }
}
/**
 * 添加消息的名称
 * 将消息的名称通过 RCTEventEmitter类的startObserving注册进去
 */
RCT_EXPORT_METHOD(notificationName:(NSString *)name){
    NativeNotificationManager *manager = [NativeNotificationManager shareNotification];
    manager.CurrentListenerName = name;
    
    if(![manager.ListenerNameArr containsObject:name]) {
        // 如果本地不存在 则 添加
        [manager.ListenerNameArr addObject:name];
    } else {
        // 否则移除对应的notification 避免 重复添加
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:name
                                                      object:nil];
    }
}
/**
 * 移除消息
 * 将消息的名称通过 RCTEventEmitter类的stopObserving移除出去
 */
RCT_EXPORT_METHOD(removeNotificationName:(NSString *)name){
    NativeNotificationManager *manager = [NativeNotificationManager shareNotification];
    manager.CurrentRemoveListenerName = nil;
}

@end

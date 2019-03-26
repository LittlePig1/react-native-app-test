
import {
  NativeModules,
  Platform,
  DeviceEventEmitter,
  NativeEventEmitter,
  Platform } from 'react-native';
const { RNListenerManager, RNAppTest } = NativeModules;
const listenerManager = new NativeEventEmitter(RNListenerManager);

export default class RNAppTestNotification {
  /* 原生之间的通信方法 主要针对iOS iOS和安卓针对不同原生容器之间的消息传递实现不一样，所以需要做定制化的方法处理 */
  /**
   *  注册监听
   */
  static addNativeListener = (name, listenerResult) => {
    if (Platform.OS === 'android') {
      this.changeInfoListener = DeviceEventEmitter.addListener(name, listenerResult);
    } else {
      console.log('iOS通知0');
      RNAppTestNotification.addiOSListener(name, listenerResult);
    }
  };

  /**
   * 移除监听
   */
  static removeNativeListener = (name) => {
    if (Platform.OS === 'android') {
      this.changeInfoListener.remove();
    } else {
      RNAppTestNotification.removeiOSListener(name);
    }
  };

  /**
   * 发送消息
   */
  static nativeEmit = (name, params) => {
    if (Platform.OS === 'android') {
      if (params) {
        DeviceEventEmitter.emit(name, params);
      } else {
        DeviceEventEmitter.emit(name, null);
      }
    } else {
      if (params) {
        RNAppTest.notification(name, params);
      } else {
        RNAppTest.notification(name, null);
      }
    }
  };

  /**
   * ios 相关
   */
    // 添加iOS通知
  static addiOSListener = async (name, listenerResult) => {
    console.log('iOS通知1');
    await RNAppTest.notificationName(name);
    this.changeListener = listenerManager.addListener(name, listenerResult);
  }

  // 移除iOS通知
  static removeiOSListener = async (name) => {
    await RNAppTest.removeNotificationName(name);
    this.changeListener.remove();
  }
}


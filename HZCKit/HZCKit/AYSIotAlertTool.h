//
//  AYSIotAlertTool.h
//  HZCKit
//
//  Created by Apple on 2020/5/28.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AYSIotAlertButtonConfigure.h"
NS_ASSUME_NONNULL_BEGIN


@interface AYSIotAlertTool : NSObject
+ (void)showIotTextField:(UIViewController *)targetVC
                   title:(NSString *)title
                 message:(NSString *)message
             placeholder:(NSString *)placeholder
       isSecureTextEntry:(BOOL)isSecureTextEntry
            keyboardType:(UIKeyboardType)keyboardType
                 confirm:(void (^)(NSString * _Nonnull))confirm
                  cancel:(void (^)(void))cancel;

+ (void)showDefaultTwoButtonAlert:(UIViewController *)targetVC
                            title:(NSString *)title
                          message:(NSString *)message
                          confirm:(void (^)(void))confirm
                           cancel:(void (^)(void))cancel;

+ (void)showTwoButtonAlert:(UIViewController *)targetVC
                     title:(NSString *)title
                   message:(NSString *)message
       leftButtonConfigure:(AYSIotAlertButtonConfigure *)leftButtonConfigure
      rightButtonConfigure:(AYSIotAlertButtonConfigure *)rightButtonConfigure
                leftHandle:(void (^)(void))leftHandle
               rightHandle:(void (^)(void))rightHandle
               closeHandle:(void(^)(void))closeHandle;

+ (void)showMessageAlert:(UIViewController *)targetVC text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END

//
//  AYSIotAlertTool.m
//  HZCKit
//
//  Created by Apple on 2020/5/28.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotAlertTool.h"
#import "ScottAlertController.h"
#import "AYSIotCustomTextFieldAlertView.h"
#import "AYSIotTwoButtonAlertView.h"
#import "AYSIotLabelAlertView.h"


@implementation AYSIotAlertTool

+ (void)showIotTextField:(UIViewController *)targetVC
                   title:(NSString *)title
                 message:(NSString *)message
             placeholder:(NSString *)placeholder
       isSecureTextEntry:(BOOL)isSecureTextEntry
            keyboardType:(UIKeyboardType)keyboardType
                 confirm:(void (^)(NSString * _Nonnull))confirm
                  cancel:(void (^)(void))cancel {
    
    AYSIotCustomTextFieldAlertView *customAlert = [AYSIotCustomTextFieldAlertView customAlertView];
    customAlert.title = title;
    customAlert.message = message;
    customAlert.placeholder = placeholder;
    customAlert.isSecureTextEntry = isSecureTextEntry;
    customAlert.keyboardType = keyboardType;
//    customAlert.frame = CGRectMake(0, 0, 268, 186);
    ScottAlertViewController *alertC = [ScottAlertViewController alertControllerWithAlertView:customAlert preferredStyle:ScottAlertControllerStyleAlert transitionAnimationStyle:ScottAlertTransitionStyleFade];
    
    [customAlert setClickCancel:^{
        if (cancel) {
            cancel();
        }
        [alertC dismissViewControllerAnimated:YES];
    }];
    
    
    [customAlert setClickConfirm:^(NSString * _Nonnull text) {
        
        if (confirm) {
            confirm(text);
        }
        [alertC dismissViewControllerAnimated:YES];
    }];
    
    [targetVC presentViewController:alertC animated:YES completion:^{
        
    }];
}

+ (void)showDefaultTwoButtonAlert:(UIViewController *)targetVC
                            title:(NSString *)title
                          message:(NSString *)message
                          confirm:(void (^)(void))confirm
                           cancel:(void (^)(void))cancel {
    
    AYSIotTwoButtonAlertView *customAlert = [AYSIotTwoButtonAlertView twoButtonAlertView];
    customAlert.title = title;
    customAlert.message = message;
    ScottAlertViewController *alertC = [ScottAlertViewController alertControllerWithAlertView:customAlert preferredStyle:ScottAlertControllerStyleAlert transitionAnimationStyle:ScottAlertTransitionStyleFade];
    
    [customAlert setClickLeftButton:^{
        if (cancel) {
            cancel();
        }
        [alertC dismissViewControllerAnimated:YES];
    }];
    
    [customAlert setClickCloseButton:^{
        if (cancel) {
            cancel();
        }
        [alertC dismissViewControllerAnimated:YES];
    }];

    [customAlert setClickRightButton:^{
        if (confirm) {
            confirm();
        }
        [alertC dismissViewControllerAnimated:YES];

    }];
    

    
    [targetVC presentViewController:alertC animated:YES completion:^{
        
    }];
}

+ (void)showTwoButtonAlert:(UIViewController *)targetVC
                     title:(NSString *)title
                   message:(NSString *)message
       leftButtonConfigure:(AYSIotAlertButtonConfigure *)leftButtonConfigure
      rightButtonConfigure:(AYSIotAlertButtonConfigure *)rightButtonConfigure
                leftHandle:(void (^)(void))leftHandle
               rightHandle:(void (^)(void))rightHandle
               closeHandle:(void(^)(void))closeHandle {
    
    
    AYSIotTwoButtonAlertView *customAlert = [AYSIotTwoButtonAlertView twoButtonAlertView];
    customAlert.title = title;
    customAlert.message = message;
    ScottAlertViewController *alertC = [ScottAlertViewController alertControllerWithAlertView:customAlert preferredStyle:ScottAlertControllerStyleAlert transitionAnimationStyle:ScottAlertTransitionStyleFade];
    
    if (leftButtonConfigure) {
        [customAlert setLeftButtonTitle:leftButtonConfigure.title titleColor:leftButtonConfigure.titleColor backgroundColor:leftButtonConfigure.backgroudColor];
    }
    
    if (rightButtonConfigure) {
        [customAlert setRightButtonTitle:rightButtonConfigure.title titleColor:rightButtonConfigure.titleColor backgroundColor:rightButtonConfigure.backgroudColor];
    }
    
    
    [customAlert setClickLeftButton:^{
        if (leftHandle) {
            leftHandle();
        }
        [alertC dismissViewControllerAnimated:YES];
    }];
    
    [customAlert setClickCloseButton:^{
        if (closeHandle) {
            closeHandle();
        }
        [alertC dismissViewControllerAnimated:YES];
    }];

    [customAlert setClickRightButton:^{
        if (rightHandle) {
            rightHandle();
        }
        [alertC dismissViewControllerAnimated:YES];
    }];
    

    
    [targetVC presentViewController:alertC animated:YES completion:^{
        
    }];

}

+ (void)showMessageAlert:(UIViewController *)targetVC text:(NSString *)text {
    AYSIotLabelAlertView *customAlert = [[AYSIotLabelAlertView alloc] init];
    
    customAlert.text = text;
    
    
    ScottAlertViewController *alertC = [ScottAlertViewController alertControllerWithAlertView:customAlert preferredStyle:ScottAlertControllerStyleAlert transitionAnimationStyle:ScottAlertTransitionStyleFade];
    
    [targetVC presentViewController:alertC animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertC dismissViewControllerAnimated:YES];
        });
    }];
}

@end

//
//  AYSIotCustomAlertView.h
//  HZCKit
//
//  Created by Apple on 2020/5/28.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AYSIotCustomTextFieldAlertView : UIView

/** <#Description#> */
@property (nonatomic, copy) NSString *title;
/** <#Description#> */
@property (nonatomic, strong) UIColor *titleColor;
/** <#Description#> */
@property (nonatomic, copy) NSString *message;
/** <#Description#> */
@property (nonatomic, copy) NSString *placeholder;
/** <#Description#> */
@property (nonatomic, assign) BOOL isSecureTextEntry;

@property(nonatomic) UIKeyboardType keyboardType;
/** <#Description#> */
@property (nonatomic, assign) BOOL isHiddenTextField;

/** <#Description#> */
@property (nonatomic, copy) void (^clickCancel)(void);

/** <#Description#> */
@property (nonatomic, copy) void (^clickConfirm)(NSString *text);


+ (instancetype)customAlertView;

@end

NS_ASSUME_NONNULL_END

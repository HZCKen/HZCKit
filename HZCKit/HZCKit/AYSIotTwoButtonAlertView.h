//
//  AYSIotTwoButtonAlertView.h
//  HZCKit
//
//  Created by Apple on 2020/5/28.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AYSIotTwoButtonAlertView : UIView

/** <#Description#> */
@property (nonatomic, copy) NSString *title;
/** <#Description#> */
@property (nonatomic, strong) UIColor *titleColor;
/** <#Description#> */
@property (nonatomic, copy) NSString *message;

/** <#Description#> */
@property (nonatomic, strong) UIColor *closeButtonColor;

/** <#Description#> */
@property (nonatomic, copy) void (^clickCloseButton)(void);

/** <#Description#> */
@property (nonatomic, copy) void (^clickLeftButton)(void);

/** <#Description#> */
@property (nonatomic, copy) void (^clickRightButton)(void);

+ (instancetype)twoButtonAlertView;

- (void)setLeftButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor;

- (void)setRightButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor;


@end

NS_ASSUME_NONNULL_END

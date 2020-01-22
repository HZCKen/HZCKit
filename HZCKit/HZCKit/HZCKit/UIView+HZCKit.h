//
//  UIView+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2018/12/21.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HZCKit)

/// 添加圆角 注意：使用该方法后不要再另外设置背景颜色
/// @param radius 圆角角度
/// @param color 背景颜色
- (void)hzc_addRounderCornerWithRadius:(CGFloat)radius backgroundColor:(UIColor *)color;

/// 设置圆形 注意：使用该方法后不要再另外设置背景颜色
/// @param color 背景颜色
- (void)hzc_addCircleBackgroundColor:(UIColor *)color;

- (UIImage *)hzc_getScreenshot;

+ (NSString *)hzc_className;

+ (instancetype)hzc_loadNib;

@end

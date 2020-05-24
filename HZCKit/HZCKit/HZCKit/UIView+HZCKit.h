//
//  UIView+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2018/12/21.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , HZCShadowPathType) {
    kShadowPathTop    = 1,
    kShadowPathBottom = 2,
    kShadowPathLeft   = 3,
    kShadowPathRight  = 4,
    kShadowPathAround = 6,
};

@interface UIView (HZCKit)

/// 添加圆角 注意：使用该方法后不要再另外设置背景颜色
/// @param radius 圆角角度
/// @param color 背景颜色
- (void)hzc_addRounderCornerWithRadius:(CGFloat)radius backgroundColor:(UIColor *)color;

/// 设置圆形 注意：使用该方法后不要再另外设置背景颜色
/// @param color 背景颜色
- (void)hzc_addCircleBackgroundColor:(UIColor *)color;

- (void)hzc_shadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(HZCShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;

/** 设置方位圆角 */
- (void)hzc_bezierPathWithRoundedRect:(UIRectCorner)corner cornerRadii:(CGSize)cornerRadii;

- (void)hzc_shadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset shadowPathType:(HZCShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;

- (UIImage *)hzc_getScreenshot;

+ (NSString *)hzc_className;

+ (instancetype)hzc_loadNib;

@end

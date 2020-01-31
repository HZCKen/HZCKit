//
//  UIImageView+HZCKit.h
//  HZCKit
//
//  Created by Ken on 2020/1/31.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (HZCKit)

/// 为iimageView添加圆角
/// @param radius 角度
- (void)hzc_addRounderCornerWithRadius:(CGFloat)radius;

/// 为imageView添加i圆形
- (void)hzc_addCircle;
@end

NS_ASSUME_NONNULL_END

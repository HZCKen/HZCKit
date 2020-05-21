//
//  UIButton+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2019/3/28.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+HZCKit.h"

@interface UIButton (HZCKit)

- (void)hzc_centerImageAndTitle;

- (void)hzc_shadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(HZCShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;

- (void)hzc_shadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset shadowPathType:(HZCShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth;

@end


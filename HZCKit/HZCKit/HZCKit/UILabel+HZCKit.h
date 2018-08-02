//
//  UILabel+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HZCKit)

/**
 已知宽度计算文字的高度

 @param width 宽度
 @return 高度
 */
- (CGFloat)hzc_getLabelHeightByWidth:(CGFloat)width;

@end

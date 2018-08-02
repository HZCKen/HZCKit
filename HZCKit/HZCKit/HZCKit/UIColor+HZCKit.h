//
//  UIColor+HZCKit.h
//  cookBook
//
//  Created by Apple on 2018/6/11.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HZCKit)
/** 16进制颜色 */
+ (UIColor *)hzc_hexStringToColor:(NSString *)stringToConvert;
/** 随机颜色 */
+ (UIColor *)hzc_randomColor;
@end

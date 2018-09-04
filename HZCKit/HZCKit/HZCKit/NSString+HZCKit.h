//
//  NSString+HZCKit.h
//  cookBook
//
//  Created by Apple on 2018/6/21.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (HZCKit)

/**
 根据字体预估宽高获取字符串实际宽高度
 
 @param font 字体大小
 @param width 预估宽度
 @param height 预估高度
 @return 返回计算后实际尺寸宽、高度
 */
- (CGSize)hzc_getWidthFromTextFontSize:(CGFloat)font AboutWidth:(CGFloat)width AndHeight:(CGFloat)height;

/**
 计算汉字个数

 @return 汉字的个数
 */
- (NSInteger)hzc_chineseCountOfString;

/**
 判断是否汉字

 @return YES为汉字 NO为非汉字
 */
- (BOOL)hzc_isChineseCharacter;


/**
 汉语数字转化为阿拉伯数字 (十万以上有问题)

 @return 阿拉伯数字
 */
- (NSString *)hzc_translatArabicNumberals;


/**
 阿拉伯数字转换为汉语数字

 @return 汉语数字
 */
- (NSString *)hzc_translatChinestNumberals;

@end

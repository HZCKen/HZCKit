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

///获取当前时间
+ (NSString *)hzc_currentDate;

/** 获取当前时间戳 */
+ (NSString *)hzc_currentTime;

/** 时间戳转时间,时间戳为13位是精确到毫秒的*/
- (NSString *)hzc_getDateString;

/** 字符串转时间戳 如：2017-4-10 17:15:10 */
- (NSString *)hzc_getTimeString;
/** 转换为16进制字符串 */
- (NSString *)hzc_changeHexString;
/** 转换为16进制字符串 */
+ (NSString *)hzc_hexStringFromString:(NSString *)string;
/** 16进制转字符串 */
- (NSString *)hzc_hexStringChangeString;
/** 16进制转字符串 */
+ (NSString *)hzc_stringFromHexString:(NSString *)hexString;
/** data转换成16进制字符串 */
+ (NSString *)hzc_hexStringFormData:(NSData *)data;
/**  16进制转NSData   */
- (NSData *)hzc_convertHexStrToData;

///传入 秒  得到  xx分钟xx秒
+ (NSString *)hzc_getMMSSFromSS:(NSInteger)seconds;

///传入 秒  得到 xx:xx:xx
+ (NSString *)hzc_getHHMMSSFromSS:(NSInteger)seconds;

@end

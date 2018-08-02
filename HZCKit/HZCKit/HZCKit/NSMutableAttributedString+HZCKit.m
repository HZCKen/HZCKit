//
//  NSMutableAttributedString+HZCKit.m
//  cookBook
//
//  Created by Apple on 2018/6/13.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "NSMutableAttributedString+HZCKit.h"
@implementation NSMutableAttributedString (HZCKit)

/**
 通过文字获取颜色富文本
 
 @param string 原始文字
 @param rangeString 改变颜色的文字
 @param textColor 文字颜色
 @return 颜色富文本
 */
+ (NSMutableAttributedString *)hzc_getColorAttributedStringWithString:(NSString *)string rangeOfString:(NSString *)rangeString textColor:(UIColor *)textColor {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:string];;
    NSRange difficultyRange = [[attributeString string] rangeOfString:rangeString];
    [attributeString addAttribute:NSForegroundColorAttributeName value: textColor range:difficultyRange];
    
    return attributeString;
}


/**
 改变字体大小
 @param string 原始文字
 @param rangeString 需要改变大小的文字
 @param fontName 字体名
 @param fontSize 字体大小
 @return 富文本
 */
+ (NSMutableAttributedString *)hzc_getFontSizeString:(NSString *)string rangeOfString:(NSString *)rangeString fontName:(NSString *)fontName fontSize:(CGFloat)fontSize {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:string];;
    NSRange difficultyRange = [[attributeString string] rangeOfString:rangeString];
    [attributeString addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:fontSize] range:difficultyRange];
    return attributeString;
}

/**
 改变字体大小
 @param string 原始文字
 @param rangeString 需要改变大小的文字
 @param fontSize 字体大小
 @return 富文本
 */
+ (NSMutableAttributedString *)hzc_getFontSizeString:(NSString *)string rangeOfString:(NSString *)rangeString fontSize:(CGFloat)fontSize {
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:string];;
    NSRange difficultyRange = [[attributeString string] rangeOfString:rangeString];
    [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:difficultyRange];
    return attributeString;
}



/**
 通过文字修改显示颜色
 
 @param rangeString 文字
 @param textColor 颜色
 */
- (void)hzc_changeColorRangeOfString:(NSString *)rangeString textColor:(UIColor *)textColor {
    NSRange difficultyRange = [[self string] rangeOfString:rangeString];
    [self addAttribute:NSForegroundColorAttributeName value: textColor range:difficultyRange];
}

/**
 修改字体大小
 
 @param rangeString 文字
 @param fontName 字体名字
 @param fontSize 字体大小
 */
- (void)hzc_changeFontSizeString:(NSString *)rangeString fontName:(NSString *)fontName fontSize:(CGFloat)fontSize {
    NSRange difficultyRange = [[self string] rangeOfString:rangeString];
    [self addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:fontSize] range:difficultyRange];
}
/**
 修改字体大小
 
 @param rangeString 文字
 @param fontSize 字体大小
 */
- (void)hzc_changeFontSizeString:(NSString *)rangeString fontSize:(CGFloat)fontSize {
    NSRange difficultyRange = [[self string] rangeOfString:rangeString];
    [self addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:difficultyRange];
}

@end

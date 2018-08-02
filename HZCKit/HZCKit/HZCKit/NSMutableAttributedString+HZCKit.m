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

@end

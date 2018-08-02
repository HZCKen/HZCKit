//
//  NSString+HZCKit.m
//  cookBook
//
//  Created by Apple on 2018/6/21.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "NSString+HZCKit.h"

@implementation NSString (HZCKit)
/**
 根据字体预估宽高获取字符串实际宽高度
 
 @param font 字体大小
 @param width 预估宽度
 @param height 预估高度
 @return 返回计算后实际尺寸宽、高度
 */
- (CGSize)hzc_getWidthFromTextFontSize:(CGFloat)font AboutWidth:(CGFloat)width AndHeight:(CGFloat)height{
    
    if (!self || self.length == 0) {
        return CGSizeZero;
        
    }
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
    
    
}


- (NSInteger)hzc_chineseCountOfString {
    
    int ChineseCount = 0;
    
    if (self.length == 0) {
        return 0;
    }
    for (int i = 0; i<self.length; i++) {
        unichar c = [self characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5)        {
            ChineseCount++ ;//汉字
        }
    }
    return ChineseCount;
}

- (BOOL)hzc_isChineseCharacter {
    
    if (self.length == 0) {
        return NO;
    }
    unichar c = [self characterAtIndex:0];
    
    if (c >=0x4E00 && c <=0x9FA5)     {
        return YES;//汉字
    } else {
        return NO;//非汉字
    }
}


@end

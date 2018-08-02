//
//  NSAttributedString+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "NSAttributedString+HZCKit.h"

@implementation NSAttributedString (HZCKit)

+ (NSAttributedString *)hzc_strikethroughStyleSingle:(NSString *)originalString {
    
    NSAttributedString *attributedString = [[NSAttributedString alloc]
                                            initWithString:originalString attributes:@{
                                                            NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
                                                                NSBaselineOffsetAttributeName: @(0)}];
    
    return attributedString;
}

@end

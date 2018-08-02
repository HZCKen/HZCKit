//
//  NSAttributedString+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (HZCKit)

/**
 单删除线

 @param originalString 原始
 @return 带有删除线的富文本
 */
+ (NSAttributedString *)hzc_strikethroughStyleSingle:(NSString *)originalString;

@end

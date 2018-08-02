//
//  UILabel+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UILabel+HZCKit.h"

@implementation UILabel (HZCKit)

- (CGFloat)hzc_getLabelHeightByWidth:(CGFloat)width {
    if (self.text != nil && self.text.length > 0) {
        // 参数1: 自适应尺寸,提供一个宽度,去自适应高度
        // 参数2:自适应设置 (以行为矩形区域自适应,以字体字形自适应)
        // 参数3:文字属性,通常这里面需要知道是字体大小
        // 参数4:绘制文本上下文,做底层排版时使用,填nil即可
        CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:self.font} context:nil].size;
        return textSize.height;
    } else {
        return 0;
    }
}
@end

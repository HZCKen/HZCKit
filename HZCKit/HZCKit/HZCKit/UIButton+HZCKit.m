//
//  UIButton+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2019/3/28.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UIButton+HZCKit.h"

@implementation UIButton (HZCKit)

- (void)hzc_centerImageAndTitle {
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = CGSizeZero;
    titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
     // 判断文字的宽度是否大于自己的宽度
    titleSize = titleSize.width > self.frame.size.width ? CGSizeMake(self.frame.size.width, titleSize.height):titleSize;
    
    CGFloat totalHeight = (imageSize.height + titleSize.height + 6);
    
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width - (titleSize.width/imageSize.width >=2 ));
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (totalHeight - titleSize.height), 0.0);
}

@end

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

- (void)hzc_shadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset shadowPathType:(HZCShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth {
    self.layer.masksToBounds = NO;//必须要等于NO否则会把阴影切割隐藏掉
    self.layer.shadowColor = shadowColor.CGColor;// 阴影颜色
    self.layer.shadowOpacity = shadowOpacity;// 阴影透明度
    self.layer.shadowOffset = shadowOffset;//shadowOffset阴影偏移,这个跟shadowRadius配合使用
    self.layer.shadowRadius = shadowRadius;//阴影半径
    CGRect shadowRect = CGRectZero;
    CGFloat originX,originY,sizeWith,sizeHeight;
    originX = 0;
    originY = 0;
    sizeWith = self.bounds.size.width;
    sizeHeight = self.bounds.size.height;
    
    if (shadowPathType == kShadowPathTop) {
        shadowRect = CGRectMake(originX, originY-shadowPathWidth/2, sizeWith, shadowPathWidth);
    } else if (shadowPathType == kShadowPathBottom){
        shadowRect = CGRectMake(originY, sizeHeight-shadowPathWidth/2, sizeWith, shadowPathWidth);
    } else if (shadowPathType == kShadowPathLeft){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    } else if (shadowPathType == kShadowPathRight){
        shadowRect = CGRectMake(sizeWith-shadowPathWidth/2, originY, shadowPathWidth, sizeHeight);
    } else if (shadowPathType == kShadowPathAround){
        shadowRect = CGRectMake(originX-shadowPathWidth/2, originY-shadowPathWidth/2, sizeWith+shadowPathWidth, sizeHeight+shadowPathWidth);
    }
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:shadowRect];
    self.layer.shadowPath = bezierPath.CGPath;//阴影路径
}

- (void)hzc_shadowPathWithColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowPathType:(HZCShadowPathType)shadowPathType shadowPathWidth:(CGFloat)shadowPathWidth {
    [self hzc_shadowPathWithColor:shadowColor shadowOpacity:shadowOpacity shadowRadius:shadowRadius shadowOffset:CGSizeZero shadowPathType:shadowPathType shadowPathWidth:shadowPathWidth];
}

@end

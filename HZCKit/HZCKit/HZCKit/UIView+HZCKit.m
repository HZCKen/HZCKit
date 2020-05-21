//
//  UIView+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2018/12/21.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UIView+HZCKit.h"

@implementation UIView (HZCKit)

- (void)hzc_addRounderCornerWithRadius:(CGFloat)radius backgroundColor:(UIColor *)color {
    CGSize size = self.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef cxt = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(cxt, color.CGColor);
    CGContextSetStrokeColorWithColor(cxt, color.CGColor);
    
    CGContextMoveToPoint(cxt, size.width, size.height-radius);
    CGContextAddArcToPoint(cxt, size.width, size.height, size.width-radius, size.height, radius);//右下角
    CGContextAddArcToPoint(cxt, 0, size.height, 0, size.height-radius, radius);//左下角
    CGContextAddArcToPoint(cxt, 0, 0, radius, 0, radius);//左上角
    CGContextAddArcToPoint(cxt, size.width, 0, size.width, radius, radius);//右上角
    CGContextClosePath(cxt);
    CGContextDrawPath(cxt, kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [imageView setImage:image];
    [self insertSubview:imageView atIndex:0];
}

- (void)hzc_addCircleBackgroundColor:(UIColor *)color {
    [self hzc_addRounderCornerWithRadius:(self.bounds.size.width / 2) backgroundColor:color];
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

- (UIImage *)hzc_getScreenshot {
    UIGraphicsBeginImageContext(CGSizeMake(self.frame.size.width, self.frame.size.height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (NSString *)hzc_className {
    return  [self description];
}

+ (instancetype)hzc_loadNib {
    return [[NSBundle mainBundle]loadNibNamed:[self description] owner:self options:nil].firstObject;
}

@end

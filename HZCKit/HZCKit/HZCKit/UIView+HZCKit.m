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

//
//  UIImage+HZCKit.m
//  cookBook
//
//  Created by Apple on 2018/6/11.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UIImage+HZCKit.h"

@implementation UIImage (HZCKit)

/** 根据颜色和高度获取图片 */
+ (UIImage *)hzc_getImageWithColor:(UIColor*)color height:(CGFloat)height {
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

/** 绘制图片圆角 */
- (UIImage *)hzc_drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/** 绘制圆 */
- (UIImage *)hzc_drawCircleInRect:(CGRect)rect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.width/2];
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/** 压缩图片 */
- (UIImage *)hzc_thumImage:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO,0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    UIImage *newImage;
    [self drawInRect:imageRect];
    newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end

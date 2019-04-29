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

/** 获取没有被渲染的原图 */
+ (UIImage *)hzc_imageAlwaysOriginalNamed:(NSString *)imageName {

    UIImage *image = [UIImage imageNamed:imageName];

    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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

+ (void)hzc_imageAsyncDecodedWithImageName:(NSString *)imageName finishedBlock:(void(^)(UIImage *image))finishedBlock {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        @autoreleasepool{
            UIImage *image = [UIImage imageNamed:imageName];
            image = [UIImage hzc_decodedImageWithImage:image];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (finishedBlock) {
                    finishedBlock(image);
                }
            });
        }
    });
}

#pragma mark - hzc_decodedImageWithImage ，hzc_colorSpaceForImageRef , hzc_shouldDecodeImage 是SD的

+ (BOOL)hzc_shouldDecodeImage:(nullable UIImage *)image {
    // Prevent "CGBitmapContextCreateImage: invalid context 0x0" error
    if (image == nil) {
        return NO;
    }
    
    // do not decode animated images
    if (image.images != nil) {
        return NO;
    }
    
    CGImageRef imageRef = image.CGImage;
    
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(imageRef);
    BOOL anyAlpha = (alpha == kCGImageAlphaFirst ||
                     alpha == kCGImageAlphaLast ||
                     alpha == kCGImageAlphaPremultipliedFirst ||
                     alpha == kCGImageAlphaPremultipliedLast);
    // do not decode images with alpha
    if (anyAlpha) {
        return NO;
    }
    
    return YES;
}

+ (UIImage *)hzc_decodedImageWithImage:(UIImage *)image {
    
    if (![UIImage hzc_shouldDecodeImage:image]) {
        return image;
    }
    @autoreleasepool{
        
        CGImageRef imageRef = image.CGImage;
        CGColorSpaceRef colorspaceRef = [UIImage hzc_colorSpaceForImageRef:imageRef];
        
        size_t width = CGImageGetWidth(imageRef);
        size_t height = CGImageGetHeight(imageRef);
        size_t bytesPerRow = 4 * width;
        
        // kCGImageAlphaNone is not supported in CGBitmapContextCreate.
        // Since the original image here has no alpha info, use kCGImageAlphaNoneSkipLast
        // to create bitmap graphics contexts without alpha info.
        CGContextRef context = CGBitmapContextCreate(NULL,
                                                     width,
                                                     height,
                                                     8,
                                                     bytesPerRow,
                                                     colorspaceRef,
                                                     kCGBitmapByteOrderDefault|kCGImageAlphaNoneSkipLast);
        if (context == NULL) {
            return image;
        }
        
        // Draw the image into the context and retrieve the new bitmap image without alpha
        CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
        CGImageRef imageRefWithoutAlpha = CGBitmapContextCreateImage(context);
        UIImage *imageWithoutAlpha = [UIImage imageWithCGImage:imageRefWithoutAlpha
                                                         scale:image.scale
                                                   orientation:image.imageOrientation];
        
        CGContextRelease(context);
        CGImageRelease(imageRefWithoutAlpha);
        return imageWithoutAlpha;
    }
}

+ (CGColorSpaceRef)hzc_colorSpaceForImageRef:(CGImageRef)imageRef {
    // current
    CGColorSpaceModel imageColorSpaceModel = CGColorSpaceGetModel(CGImageGetColorSpace(imageRef));
    CGColorSpaceRef colorspaceRef = CGImageGetColorSpace(imageRef);
    
    BOOL unsupportedColorSpace = (imageColorSpaceModel == kCGColorSpaceModelUnknown ||
                                  imageColorSpaceModel == kCGColorSpaceModelMonochrome ||
                                  imageColorSpaceModel == kCGColorSpaceModelCMYK ||
                                  imageColorSpaceModel == kCGColorSpaceModelIndexed);
    if (unsupportedColorSpace) {
        colorspaceRef = CGColorSpaceCreateDeviceRGB();
        CFAutorelease(colorspaceRef);
    }
    return colorspaceRef;
}



@end

//
//  UIImage+HZCKit.h
//  cookBook
//
//  Created by Apple on 2018/6/11.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HZCKit)
/** 根据颜色获取1*1矩形图片 */
+ (UIImage *)hzc_getImageWithColor:(UIColor*)color;
/** 根据颜色和大小获取图片 */
+ (UIImage *)hzc_getImageWithColor:(UIColor*)color size:(CGSize)size;
/** 获取没有被渲染的原图 */
+ (UIImage *)hzc_imageAlwaysOriginalNamed:(NSString *)imageName;
/** 绘制方位圆角 */
- (UIImage *)hzc_drawCornerInRect:(CGRect)rect corners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius;
/** 绘制图片圆角 */
- (UIImage *)hzc_drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
/** 绘制圆 */
- (UIImage *)hzc_drawCircleInRect:(CGRect)rect;
/** 压缩图片 */
- (UIImage *)hzc_thumImage:(CGSize)size;
/** 异步解码图片 */
+ (void)hzc_imageAsyncDecodedWithImageName:(NSString *)imageName finishedBlock:(void(^)(UIImage *image))finishedBlock;
@end

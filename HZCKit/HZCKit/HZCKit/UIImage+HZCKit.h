//
//  UIImage+HZCKit.h
//  cookBook
//
//  Created by Apple on 2018/6/11.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HZCKit)
/** 根据颜色和高度获取图片 */
+ (UIImage *)hzc_getImageWithColor:(UIColor*)color height:(CGFloat)height;
/** 绘制图片圆角 */
- (UIImage *)hzc_drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
/** 绘制圆 */
- (UIImage *)hzc_drawCircleInRect:(CGRect)rect;
/** 压缩图片 */
- (UIImage *)hzc_thumImage:(CGSize)size;
@end

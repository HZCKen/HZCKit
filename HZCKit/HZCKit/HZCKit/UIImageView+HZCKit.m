//
//  UIImageView+HZCKit.m
//  HZCKit
//
//  Created by Ken on 2020/1/31.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UIImageView+HZCKit.h"
#import "UIImage+HZCKit.h"



@implementation UIImageView (HZCKit)

- (void)hzc_addRounderCornerWithRadius:(CGFloat)radius {
    UIImage *temp = [self.image hzc_drawCornerInRect:self.frame.size cornerRadius:radius];
    self.image = temp;
}

- (void)hzc_addCircle {
    [self hzc_addRounderCornerWithRadius:(self.bounds.size.width / 2)];
}

@end

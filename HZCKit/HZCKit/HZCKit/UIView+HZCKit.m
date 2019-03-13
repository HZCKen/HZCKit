//
//  UIView+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2018/12/21.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UIView+HZCKit.h"

@implementation UIView (HZCKit)


+ (NSString *)hzc_className {
    return  [self description];
}

+ (instancetype)hzc_loadNib {
    return [[NSBundle mainBundle]loadNibNamed:[self description] owner:self options:nil].firstObject;
}

@end

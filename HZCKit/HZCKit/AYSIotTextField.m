//
//  AYSIotTextField.m
//  HZCKit
//
//  Created by Apple on 2020/5/29.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotTextField.h"

@implementation AYSIotTextField


//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect inset = CGRectMake(bounds.origin.x+20, bounds.origin.y, bounds.size.width, bounds.size.height);//更好理解些
    return inset;
}

@end

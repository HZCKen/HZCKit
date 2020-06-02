//
//  AYSIotRoomLabel.m
//  HZCKit
//
//  Created by Apple on 2020/5/22.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotRoomLabel.h"
#define SelectedSize 16
#define NormalSize 12

@implementation AYSIotRoomLabel


- (instancetype)initWithText:(NSString *)text {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.font = [UIFont systemFontOfSize:SelectedSize];
        self.text = text;
        [self sizeToFit];
        self.font = [UIFont systemFontOfSize:NormalSize];
        self.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.touch) {
        self.touch();
    }
}

-(void)setScale:(CGFloat)scale {
    _scale = scale;

    //最大缩放比例
    CGFloat maxScale = (CGFloat)SelectedSize / NormalSize - 1;

    //实际缩放比例
    CGFloat reaScale = maxScale * scale +1;

    self.transform = CGAffineTransformMakeScale(reaScale, reaScale);

    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1.0];

}


@end

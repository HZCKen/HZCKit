//
//  CustomSwitchView.m
//  HZCKit
//
//  Created by Apple on 2020/5/22.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "CustomSwitchView.h"

@interface CustomSwitchView ()

/** <#Description#> */
@property (nonatomic, strong) UIView *backGroundView;

/** <#Description#> */
@property (nonatomic, strong) UIButton *leftButton;
/** <#Description#> */
@property (nonatomic, strong) UIButton *rightButton;

/** <#Description#> */
@property (nonatomic, strong) UIView *circleView;

@end


@implementation CustomSwitchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backGroundView.frame = self.bounds;
    _backGroundView.layer.cornerRadius = self.bounds.size.height / 2;
    CGFloat buttonWidth = self.bounds.size.width / 2;
    CGFloat buttonHeight = self.bounds.size.height;
    CGFloat buttonY = 0;
    CGFloat leftButtonX = 0;
    CGFloat rightButtonX = buttonWidth;
    
    self.leftButton.frame = CGRectMake(leftButtonX, buttonY, buttonWidth, buttonHeight);
    self.rightButton.frame = CGRectMake(rightButtonX, buttonY, buttonWidth, buttonHeight);
    
    CGFloat circleWidth = buttonWidth - 13;
    
    self.circleView.frame = CGRectMake(0, 0, circleWidth, circleWidth);
    self.circleView.center = self.leftButton.center;
    self.circleView.layer.cornerRadius = circleWidth / 2;
}

- (void)setupUI {

    [self addSubview:self.backGroundView];
    [self addSubview:self.leftButton];
    [self addSubview:self.rightButton];
    [self addSubview:self.circleView];
    
}


- (void)clickButton:(UIButton *)sender {
    if (sender == self.leftButton) {
//        NSLog(@"left");
        self.isOn = NO;
    } else {
//        NSLog(@"right");
        self.isOn = YES;
    }
    
    if (self.switchVauleChange) {
        self.switchVauleChange(self.isOn);
    }
    
}

- (void)setIsOn:(BOOL)isOn {
    _isOn = isOn;
    [self updateCiicleView];
}

- (void)updateCiicleView {

    [UIView animateWithDuration:0.25 animations:^{
        self.circleView.center = self.isOn ? self.rightButton.center : self.leftButton.center;
    }];
}


- (UIView *)backGroundView {
    if (_backGroundView == nil) {
        _backGroundView = [[UIView alloc] init];
        _backGroundView.layer.borderWidth = 1;
        _backGroundView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1].CGColor;
        
    }
    return _backGroundView;
}


- (UIButton *)leftButton {
    if (_leftButton == nil) {
        _leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_leftButton addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (_rightButton == nil) {
        _rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_rightButton addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _rightButton;
}

- (UIView *)circleView {
    if (_circleView == nil) {
        _circleView = [[UIView alloc] init];
        _circleView.backgroundColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1];
    }
    return _circleView;
}

@end

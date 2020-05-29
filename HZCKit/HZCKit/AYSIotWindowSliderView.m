//
//  AYSIotWindowSliderView.m
//  HZCKit
//
//  Created by Apple on 2020/5/27.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotWindowSliderView.h"
#import "Masonry.h"
#import "AYSIotSliderView.h"
#import "UIView+HZCKit.h"
@interface AYSIotWindowSliderView ()

/** <#Description#> */
@property (nonatomic, strong) AYSIotSliderView *sliderView;

/** <#Description#> */
@property (nonatomic, strong) UIButton *addButton;
/** <#Description#> */
@property (nonatomic, strong) UIButton *minusButton;

/** <#Description#> */
@property (nonatomic, strong) UIView *contentBgView;

/** <#Description#> */
@property (nonatomic, strong) UIView *contentTopView;

/** <#Description#> */
@property (nonatomic, strong) UIView *contentOpenView;

@end



@implementation AYSIotWindowSliderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI {
    [self setupContentView];
    [self setupSliderView];
    
}

- (void)setupContentView {
    
    [self addSubview:self.contentBgView];
    [self.contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(148);
        make.height.mas_equalTo(196);
    }];
    
    [self.contentBgView addSubview:self.contentTopView];
    [self.contentTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentBgView);
        make.height.mas_equalTo(30.5);
    }];
    
    [self addSubview:self.contentOpenView];
    [self.contentOpenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentTopView.mas_bottom);
        make.width.equalTo(self.contentBgView.mas_width);
        make.height.equalTo(self.contentBgView.mas_height).offset(-30.5);
        make.trailing.equalTo(self.contentBgView);
    }];
    
    
}

- (void)setupSliderView {
    UIView *bgView = [[UIView alloc] init];
    [self addSubview:bgView];
    bgView.backgroundColor = [UIColor clearColor];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.mas_trailing).offset(-36);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(18);
    }];
    
    [bgView addSubview:self.sliderView];
    [self.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView.mas_centerX);
        make.centerY.equalTo(bgView.mas_centerY);
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(189);
    }];
    
    [bgView addSubview:self.addButton];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(16);
        make.centerX.equalTo(bgView.mas_centerX);
        make.bottom.equalTo(self.sliderView.mas_top).offset(-16);
    }];

    [bgView addSubview:self.minusButton];
    [self.minusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(16);
        make.centerX.equalTo(bgView.mas_centerX);
        make.top.equalTo(self.sliderView.mas_bottom).offset(16);
    }];
    

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.sliderView.layer.cornerRadius = 3.8;
    [self.contentBgView hzc_bezierPathWithRoundedRect:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(8, 8)];
//    NSLog(@"contentBgView %@", NSStringFromCGRect(self.contentBgView.frame));
//
//    NSLog(@"contentOpen %@", NSStringFromCGRect(self.contentOpenView.frame));
    [self.contentOpenView hzc_bezierPathWithRoundedRect:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:(CGSizeMake(8, 8))];
}

- (void)clickAddButton:(UIButton *)sender {
    self.sliderView.currentPercent += 0.1;
}

- (void)clickMinusButton:(UIButton *)sender {
    self.sliderView.currentPercent -= 0.1;
}

- (void)setCurrentPercent:(CGFloat)currentPercent {
    _currentPercent = currentPercent;
    _currentPercent = currentPercent;
    CGFloat minPercent = 0;
    CGFloat maXPercent = 1;
    _currentPercent = MAX(minPercent, _currentPercent);
    _currentPercent = MIN(maXPercent, _currentPercent);
//    CATransform3D trans = CATransform3DIdentity;
//    CGFloat angel =45;
//    trans.m34 = -1 / 500;
//    trans = CATransform3DMakeRotation(angel, 10, 0, 10);
////    CATransform3DMakeRotation(30, 0, 0, 5);
//
////    self.contentOpenView.layer.anchorPoint = CGPointMake(0.5, 1);
//    self.contentOpenView.layer.transform = CATransform3DRotate(trans, angel, 0, 1, 0);
//    [self.contentOpenView hzc_bezierPathWithRoundedRect:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:(CGSizeMake(8, 8))];

    CATransform3D rotationTransform = CATransform3DIdentity;
    rotationTransform.m34 = -1.0f/500;//注意这里要在CATransform3DRotate前调用，否则看不效果。
    rotationTransform = CATransform3DRotate(rotationTransform, 0.5 * M_PI_2, -1.0f,1.0f, 0.f);
    self.contentOpenView.layer.transform = rotationTransform;
    self.contentOpenView.layer.zPosition = 100;
}

- (AYSIotSliderView *)sliderView {
    if (_sliderView == nil) {
        _sliderView = [[AYSIotSliderView alloc] init];
        _sliderView.backgroundColor = [UIColor lightGrayColor];
        _sliderView.progressColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1.0];
    }
    return _sliderView;
}

- (UIButton *)addButton {
    if (_addButton == nil) {
        _addButton = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
        [_addButton addTarget:self action:@selector(clickAddButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _addButton;
}

- (UIButton *)minusButton {
    if (_minusButton == nil) {
        _minusButton = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
        [_minusButton addTarget:self action:@selector(clickMinusButton:) forControlEvents:(UIControlEventTouchUpInside)];

    }
    return _minusButton;
}

- (UIView *)contentBgView {
    if (_contentBgView == nil) {
        _contentBgView = [[UIView alloc] init];
        _contentBgView.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
//        _contentBgView.backgroundColor = [UIColor clearColor];
    }
    return _contentBgView;
}

- (UIView *)contentTopView {
    if (_contentTopView == nil) {
        _contentTopView = [[UIView alloc] init];
         _contentTopView.backgroundColor = [UIColor colorWithRed:86/255.0 green:127/255.0 blue:213/255.0 alpha:1.0];
    }
    return _contentTopView;
}

- (UIView *)contentOpenView {
    if (_contentOpenView == nil) {
        _contentOpenView = [[UIView alloc] init];
        _contentOpenView.backgroundColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1.0];
    }
    return _contentOpenView;
}

@end

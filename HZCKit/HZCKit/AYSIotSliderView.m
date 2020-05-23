//
//  AYSIotSliderView.m
//  HZCKit
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotSliderView.h"

@interface AYSIotSliderView ()

/** <#Description#> */
@property (nonatomic, strong) UIView *thumbView;
/** <#Description#> */
@property (nonatomic, strong) UIView *progressView;

/** <#Description#> */
@property (nonatomic, assign) CGFloat thumbWidth;
@end

@implementation AYSIotSliderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initData];
    [self setupUI];
}

- (void)initData {
    self.thumbWidth = 25;
    self.transform = CGAffineTransformScale(self.transform, 1.0, -1.0);
}


- (void)setupUI {
    [self addSubview:self.thumbView];
    [self addSubview:self.progressView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    CGFloat thumbY = height - self.thumbWidth;
    
    self.thumbView.frame = CGRectMake(width / 2 - (self.thumbWidth / 2), thumbY, self.thumbWidth, self.thumbWidth);
    NSLog(@"%s", __FUNCTION__);
}

- (void)setProgressColor:(UIColor *)progressColor {
    _progressColor = progressColor;
    self.progressView.backgroundColor = progressColor;
}

- (void)setCurrentPercent:(CGFloat)currentPercent {
    _currentPercent = currentPercent;
    CGFloat minPercent = 0;
    CGFloat maXPercent = 1;
    _currentPercent = MAX(minPercent, _currentPercent);
    _currentPercent = MIN(maXPercent, _currentPercent);
    
//    [self layoutSubviews];
    
    
    CGFloat  centerY = (self.frame.size.height ) * _currentPercent - self.thumbWidth;

    
    

   self.thumbView.center = CGPointMake(self.thumbView.center.x, centerY);
    NSLog(@"%s", __FUNCTION__);
    
    NSLog(@"%@", NSStringFromCGPoint(self.thumbView.center));
    
}

- (UIView *)thumbView {
    if (_thumbView == nil) {
        _thumbView = [[UIView alloc] init];
        _thumbView.frame = CGRectMake(0, 0, self.thumbWidth, self.thumbWidth);
        _thumbView.backgroundColor = [UIColor redColor];
    }
    return _thumbView;
}

- (UIView *)progressView {
    if (_progressView == nil) {
        _progressView = [[UIView alloc] init];
    }
    return _progressView;
}

@end

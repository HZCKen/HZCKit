//
//  AYSIotWindowSliderView.m
//  HZCKit
//
//  Created by Apple on 2020/5/25.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotCurtainSliderView.h"
#import "Masonry.h"
#import "UIView+HZCKit.h"

@interface AYSIotCurtainSliderView ()
/** <#Description#> */
@property (nonatomic, strong) UIView *topView;
/** <#Description#> */
@property (nonatomic, strong) UIView *leftView;
/** <#Description#> */
@property (nonatomic, strong) UIView *rightView;
@end

@implementation AYSIotCurtainSliderView

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
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.width.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
    [self addSubview:self.leftView];
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom);
        make.leading.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5).offset(-1);
    }];
    UIPanGestureRecognizer *leftGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [self.leftView addGestureRecognizer:leftGesture];
    
    [self addSubview:self.rightView];
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom);
        make.trailing.bottom.equalTo(self);
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5).offset(-1);
    }];
    UIPanGestureRecognizer *rightGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [self.rightView addGestureRecognizer:rightGesture];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.topView hzc_bezierPathWithRoundedRect:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
    [self.leftView hzc_bezierPathWithRoundedRect:UIRectCornerBottomLeft cornerRadii:CGSizeMake(8, 8)];
    [self.rightView hzc_bezierPathWithRoundedRect:UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 8)];
}

- (void)panGestureAction:(UIPanGestureRecognizer *)gesture {
    if (gesture.view == self.leftView) {
        switch (gesture.state) {
            case UIGestureRecognizerStateBegan:
                if (self.beginDrag) {
                    self.beginDrag();
                }
                break;
            case UIGestureRecognizerStateChanged:{
                CGPoint point = [gesture locationInView:self];
                CGFloat  percent = [self getPercentByX:point.x];
                self.currentPercent = percent;
                if (self.changeDrag) {
                    self.changeDrag(self.currentPercent);
                }
            }
              break;
            case UIGestureRecognizerStateEnded:
                if (self.endDrag) {
                    self.endDrag(self.currentPercent);
                }
                break;
            default:
                break;
        }
    }
    
    if (gesture.view == self.rightView) {
        switch (gesture.state) {
             case UIGestureRecognizerStateBegan:
                if (self.beginDrag) {
                    self.beginDrag();
                }
                 break;
             case UIGestureRecognizerStateChanged:{
                 CGFloat maxThumbArea = self.bounds.size.width / 2;
                 CGFloat percent = 0;
                 CGPoint point = [gesture locationInView:self];
                 percent = [self getPercentByX:(point.x - maxThumbArea)];
                 percent = 1 - percent;
                 self.currentPercent = percent;
                 if (self.changeDrag) {
                     self.changeDrag(self.currentPercent);
                 }
             }
               break;
             case UIGestureRecognizerStateEnded:
                if (self.endDrag) {
                    self.endDrag(self.currentPercent);
                }
                 break;
             default:
                 break;
         }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    if (touch.view == self.leftView) {
//        NSLog(@"left");
    }
    
    
    if (touch.view == self.rightView) {
//        NSLog(@"right");
    }
    
    if (touch.view == self) {
        CGPoint point = [touch locationInView:self];
        CGFloat maxThumbArea = self.bounds.size.width / 2;

        if (point.x < maxThumbArea ) {
            CGPoint point = [touch locationInView:self];
            CGFloat  percent = [self getPercentByX:point.x];
            self.currentPercent = percent;
        } else {
            CGFloat maxThumbArea = self.bounds.size.width / 2;
            CGFloat percent = 0;
            CGPoint point = [touch locationInView:self];
            percent = [self getPercentByX:(point.x - maxThumbArea)];
            percent = 1 - percent;
            self.currentPercent = percent;
        }
        
        if (self.touch) {
            self.touch(self.currentPercent);
        }
        
    }
    
}


- (CGFloat)getPercentByX:(CGFloat)pointX {
    CGFloat minThumbArea = 0;
    CGFloat maxThumbArea = self.bounds.size.width / 2;
    
    CGFloat movePosition = 0;
    
    movePosition = MAX(minThumbArea, pointX);
    movePosition = MIN(maxThumbArea, movePosition);
    return movePosition/maxThumbArea;
}

- (void)setCurrentPercent:(CGFloat)currentPercent {
    _currentPercent = currentPercent;
    CGFloat minPercent = 0;
    CGFloat maXPercent = 1;
    _currentPercent = MAX(minPercent, _currentPercent);
    _currentPercent = MIN(maXPercent, _currentPercent);
    CGFloat maxThumbArea = self.bounds.size.width / 2;
    CGFloat width = maxThumbArea * _currentPercent;
    CGFloat offset = maxThumbArea - width + 1;
//    NSLog(@"percent %lf width %lf offset %lf", _currentPercent, width, offset);
    if (_currentPercent == 0) {
        self.leftView.hidden = YES;
        self.rightView.hidden = YES;
        return;
    }
    
    self.leftView.hidden = NO;
    self.rightView.hidden = NO;
    
    [self.leftView mas_updateConstraints:^(MASConstraintMaker *make) {
         make.width.mas_equalTo(self.mas_width).multipliedBy(0.5).offset(-offset);
    }];
    
    [self.rightView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.5).offset(-offset);
    }];
    
}


- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor colorWithRed:86/255.0 green:127/255.0 blue:213/255.0 alpha:1.0];
    }
    return _topView;
}

- (UIView *)leftView {
    if (_leftView == nil) {
        _leftView = [[UIView alloc] init];
//        _leftView.backgroundColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
        _leftView.backgroundColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1.0];
    }
    return _leftView;
}

- (UIView *)rightView {
    if (_rightView == nil) {
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1.0];
    }
    return _rightView;
}

@end

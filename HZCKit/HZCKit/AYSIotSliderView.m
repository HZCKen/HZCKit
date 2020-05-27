//
//  AYSIotSliderView.m
//  HZCKit
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotSliderView.h"
#import "UIView+HZCKit.h"

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
    [self addSubview:self.progressView];
    [self addSubview:self.thumbView];
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [self.thumbView addGestureRecognizer:gesture];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    CGFloat thumbY = height - self.thumbWidth;
    CGFloat centerX = width / 2 - (self.thumbWidth / 2);
    self.thumbView.frame = CGRectMake(centerX, thumbY, self.thumbWidth, self.thumbWidth);

//    NSLog(@"%s", __FUNCTION__);
//    NSLog(@"%f", _currentPercent);
    CGFloat  centerY = (self.frame.size.height) * _currentPercent;
    
    self.thumbView.center = CGPointMake(self.thumbView.center.x, centerY);
    if (_currentPercent == 1) {
        self.progressView.frame = CGRectMake(0, 0, width, height);
        [self.progressView hzc_bezierPathWithRoundedRect:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(12, 12)];
    } else if (_currentPercent > 0.96) {
        CGFloat corner = 12 * _currentPercent;
        self.progressView.frame = CGRectMake(0, 0, width, centerY);
        [self.progressView hzc_bezierPathWithRoundedRect:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(corner, corner)];
    } else {
        self.progressView.frame = CGRectMake(0, 0, width, centerY);
        [self.progressView hzc_bezierPathWithRoundedRect:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(12, 12)];
    }
    [self.thumbView hzc_shadowPathWithColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2] shadowOpacity:1 shadowRadius:10 shadowOffset:CGSizeMake(0, 5) shadowPathType:(kShadowPathAround) shadowPathWidth:10];
}

- (void)panGestureAction:(UIPanGestureRecognizer *)gesture {
    
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            if (self.beginDrag) {
                self.beginDrag();
            }
            break;
            
        case UIGestureRecognizerStateChanged:{
            [self layoutProgress:gesture];
            
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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __FUNCTION__);
    UITouch *touch = [touches anyObject];
    
    if (touch.view == self.thumbView) {
        NSLog(@"滑块");
        return;
    }
  
    [self layoutProgress:touch];
    
    if (self.touch) {
        self.touch(self.currentPercent);
    }
}

- (void)layoutProgress:(id)touch {
    
    if (![touch respondsToSelector:@selector(locationInView:)]) {
        return;
    }
    
    CGFloat height = self.bounds.size.height;
     //            滑块最大最小的区域
     CGFloat minThumbArea = 0;
     CGFloat maxThumbArea = height;
     
     CGPoint point = [touch locationInView:self];
     CGFloat movePosition = 0;
     CGFloat percent = 0 ;
     
     movePosition = MAX(minThumbArea, point.y);
     movePosition = MIN(maxThumbArea, movePosition);
     
     percent = (movePosition)/(self.frame.size.height) ;
     
     self.currentPercent = percent;
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

    [self setNeedsLayout];

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

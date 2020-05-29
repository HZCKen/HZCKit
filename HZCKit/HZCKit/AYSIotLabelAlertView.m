//
//  AYSIotLabelAlertView2.m
//  HZCKit
//
//  Created by Apple on 2020/5/29.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotLabelAlertView.h"

#import "UIView+HZCKit.h"
#import "Masonry.h"
@interface AYSIotLabelAlertView ()
@property (strong, nonatomic)  UIView *bgView;
@property (strong, nonatomic)  UILabel *tipLabel;

@end

@implementation AYSIotLabelAlertView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(268);
    }];
    
    [self.bgView addSubview:self.tipLabel];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.bgView.mas_trailing).offset(-26);
        make.leading.equalTo(self.bgView.mas_leading).offset(26);
        make.centerY.equalTo(self.bgView.mas_centerY);
        make.top.equalTo(self.bgView.mas_top).offset(20);
        make.bottom.equalTo(self.bgView.mas_bottom).offset(-20);
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.bgView.layer.cornerRadius = 5.3;
    [self.bgView hzc_shadowPathWithColor:[UIColor redColor] shadowOpacity:1 shadowRadius:5.3 shadowOffset:CGSizeMake(0,3) shadowPathType:(kShadowPathAround) shadowPathWidth:3];
}


- (void)setText:(NSString *)text {
    _text = text;
    
    self.tipLabel.text = text;
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    
    
    self.tipLabel.textColor = textColor;
}

-(UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)tipLabel {
    if (_tipLabel == nil) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.font = [UIFont fontWithName:@"PingFang SC" size:16];
        _tipLabel.numberOfLines = 0;
        _tipLabel.textColor = [UIColor redColor];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tipLabel;
}

@end

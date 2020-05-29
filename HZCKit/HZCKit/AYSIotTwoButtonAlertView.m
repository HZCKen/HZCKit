//
//  AYSIotTwoButtonAlertView.m
//  HZCKit
//
//  Created by Apple on 2020/5/28.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotTwoButtonAlertView.h"
#import "UIView+HZCKit.h"
@interface AYSIotTwoButtonAlertView ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@end

@implementation AYSIotTwoButtonAlertView

+ (instancetype)twoButtonAlertView {
    return [[NSBundle mainBundle] loadNibNamed:@"AYSIotTwoButtonAlertView" owner:nil options:nil].firstObject;
}

- (void)setLeftButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor {
    [self.leftButton setTitle:title forState:(UIControlStateNormal)];
    [self.leftButton setTitleColor:titleColor forState:(UIControlStateNormal)];
    [self.leftButton setBackgroundColor:backgroundColor];
    if (backgroundColor != [UIColor whiteColor]) {
        self.leftButton.layer.borderColor = backgroundColor.CGColor;
    }
}

- (void)setRightButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor {
    [self.rightButton setTitle:title forState:(UIControlStateNormal)];
    [self.rightButton setTitleColor:titleColor forState:(UIControlStateNormal)];
    [self.rightButton setBackgroundColor:backgroundColor];
    if (backgroundColor != [UIColor whiteColor]) {
        self.rightButton.layer.borderColor = backgroundColor.CGColor;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
    [self.bgView hzc_bezierPathWithRoundedRect:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(5.3, 5.3)];
    [self hzc_shadowPathWithColor:[UIColor redColor] shadowOpacity:1 shadowRadius:5.3 shadowOffset:CGSizeMake(0,3) shadowPathType:(kShadowPathAround) shadowPathWidth:3];
    self.leftButton.layer.borderWidth = 1.0f;
    self.leftButton.layer.cornerRadius = 5.3;
    self.leftButton.layer.borderColor = [UIColor colorWithRed:153 /255.0 green:153 /255.0 blue:153 /255.0 alpha:1].CGColor;
    
    self.rightButton.layer.borderWidth = 1.0f;
    self.rightButton.layer.cornerRadius = 5.3;
    self.rightButton.layer.borderColor = [UIColor colorWithRed:153 /255.0 green:153 /255.0 blue:153 /255.0 alpha:1].CGColor;

}

- (void)layoutSubviews {
    [super layoutSubviews];

}
- (IBAction)clickCloseButton:(UIButton *)sender {
    if (self.clickCloseButton) {
        self.clickCloseButton();
    }
}

- (IBAction)clickLeftButton:(UIButton *)sender {
    if (self.clickLeftButton) {
        self.clickLeftButton();
    }
    
}
- (IBAction)clickRightButton:(UIButton *)sender {
    if (self.clickRightButton) {
        self.clickRightButton();
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

- (void)setMessage:(NSString *)message {
    _message = message;
    self.messageLabel.text = message;
}





@end

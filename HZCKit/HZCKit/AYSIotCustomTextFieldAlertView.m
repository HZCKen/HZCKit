//
//  AYSIotCustomAlertView.m
//  HZCKit
//
//  Created by Apple on 2020/5/28.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "AYSIotCustomTextFieldAlertView.h"
#import "UIView+HZCKit.h"

@interface AYSIotCustomTextFieldAlertView ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@end

@implementation AYSIotCustomTextFieldAlertView

+ (instancetype)customAlertView {
    return [[NSBundle mainBundle] loadNibNamed:@"AYSIotCustomAlertView" owner:nil options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
     [self.bgView hzc_bezierPathWithRoundedRect:(UIRectCornerAllCorners) cornerRadii:CGSizeMake(5.3, 5.3)];
     [self hzc_shadowPathWithColor:[UIColor redColor] shadowOpacity:1 shadowRadius:5.3 shadowOffset:CGSizeMake(0,3) shadowPathType:(kShadowPathAround) shadowPathWidth:3];
    self.cancelButton.layer.borderWidth = 1.0f;
    self.cancelButton.layer.cornerRadius = 5.3;
    self.cancelButton.layer.borderColor = [UIColor colorWithRed:187 /255.0 green:187 /255.0 blue:187 /255.0 alpha:1].CGColor;
    
    self.confirmButton.layer.borderWidth = 1.0f;
    self.confirmButton.layer.cornerRadius = 5.3;
    self.confirmButton.layer.borderColor = [UIColor colorWithRed:187 /255.0 green:187 /255.0 blue:187 /255.0 alpha:1].CGColor;

}

- (IBAction)clickCloseButton:(UIButton *)sender {
    if (self.clickCancel) {
        self.clickCancel();
    }
}

- (IBAction)clickConfimButton:(UIButton *)sender {
    if (self.clickConfirm) {
        self.clickConfirm(self.textField.text);
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

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    self.textField.placeholder = placeholder;
}

- (void)setIsSecureTextEntry:(BOOL)isSecureTextEntry {
    _isSecureTextEntry = isSecureTextEntry;
    self.textField.secureTextEntry = isSecureTextEntry;
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    _keyboardType = keyboardType;
    self.textField.keyboardType = keyboardType;
}

- (void)setIsHiddenTextField:(BOOL)isHiddenTextField {
    _isHiddenTextField = isHiddenTextField;
    
    if (isHiddenTextField) {
        self.textField.hidden = isHiddenTextField;
    }
    
}

@end

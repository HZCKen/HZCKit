//
//  UISearchBar+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2019/3/13.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UISearchBar+HZCKit.h"

@implementation UISearchBar (HZCKit)

- (void)hzc_setBackgroundColor:(UIColor *)color {
    //设置背景图是为了去掉上下黑线
    self.backgroundImage = [[UIImage alloc]init];
    self.barTintColor = color;
}

- (void)hzc_setIconImageName:(NSString *)iconImageName {
    [self setImage:[UIImage imageNamed:iconImageName] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
}

- (void)hzc_setTextColor:(UIColor *)textColor {
    [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].textColor = textColor;
}

- (void)hzc_setTextFont:(UIFont *)font {
    [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].font = font;
}

- (void)hzc_setTextFieldTintColor:(UIColor *)tintColor {
    UITextField *textField = [self valueForKey:@"searchField"];
    textField.tintColor = tintColor;
}

- (UITextField *)hzc_getTextField {
    return [self valueForKey:@"searchField"];
}

- (void)hzc_setCancelButtonTitle:(NSString *)title {
//    [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].title = title;
    for (UIView *view in self.subviews.lastObject.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            UIButton *cancel = (UIButton *)view;
            [cancel setTitle:title forState:UIControlStateNormal];
        }
    }
}

- (void)hzc_setCancelButtonFont:(UIFont *)font {
    NSDictionary *textAttr = @{NSFontAttributeName:font};
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:textAttr forState:(UIControlStateNormal)];
}

- (UIButton *)hzc_getCancelButton {
    for (UIView *view in self.subviews.lastObject.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            UIButton *cancel = (UIButton *)view;
            return cancel;
        }
    }
    return nil;
}

- (UIButton *)hzc_addRightButton:(NSString *)ImageName {
    UIButton *voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [voiceButton setImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
    UITextField *textField = [self valueForKey:@"searchField"];
    [textField addSubview:voiceButton];
    //Autolayout
    voiceButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *views = NSDictionaryOfVariableBindings(voiceButton);
    //设置水平方向约束
    [textField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[voiceButton(21)]-|" options:NSLayoutFormatAlignAllRight | NSLayoutFormatAlignAllLeft metrics:nil views:views]];
    //设置高度约束
    [textField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[voiceButton(21)]" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:views]];
    //设置垂直方向居中约束
    [textField addConstraint:[NSLayoutConstraint constraintWithItem:voiceButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:textField attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
//    voiceButton add
    return voiceButton;
}



@end

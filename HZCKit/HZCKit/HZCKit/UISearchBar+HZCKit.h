//
//  UISearchBar+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2019/3/13.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UISearchBar (HZCKit)

- (void)hzc_setBackgroundColor:(UIColor *)color;

- (void)hzc_setIconImageName:(NSString *)iconImageName;
/** 修改文字颜色 */
- (void)hzc_setTextColor:(UIColor *)textColor;
/** 修改文字字号 */
- (void)hzc_setTextFont:(UIFont *)font;
/** 设置光标的颜色 */
- (void)hzc_setTextFieldTintColor:(UIColor *)tintColor;

- (UITextField *)hzc_getTextField;
/** 设置取消按钮文字 */
- (void)hzc_setCancelButtonTitle:(NSString *)title;
/** 设置取消按钮字号 */
- (void)hzc_setCancelButtonFont:(UIFont *)font;
/** 获取取消按钮 */
- (UIButton *)hzc_getCancelButton;
/** 在右侧添加按钮 */
- (UIButton *)hzc_addRightButton:(NSString *)ImageName;

@end


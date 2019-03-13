//
//  UISearchBar+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2019/3/13.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UISearchBar+HZCKit.h"

@implementation UISearchBar (HZCKit)

- (void)hzc_setCancelButtonTitle:(NSString *)title {
//    [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].title = title;
    for (UIView *view in self.subviews.lastObject.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            UIButton *cancel = (UIButton *)view;
            [cancel setTitle:title forState:UIControlStateNormal];
        }
    }
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

@end

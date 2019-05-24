//
//  HZCMenuLabel.m
//  HZCKit
//
//  Created by Apple on 2019/5/24.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "HZCMenuLabel.h"

@implementation HZCMenuLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI {
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
}

- (void)labelClick{
    
    // 让label成为第一响应者
    
    [self becomeFirstResponder];
    
    //获得菜单 - 单例模式
    UIMenuController * menu = [UIMenuController sharedMenuController];
    
    // 添加MenuItem
//    UIMenuItem* ding = [[UIMenuItem alloc] initWithTitle:@"顶" action:@selector(copy:)];
//    UIMenuItem* replay = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(reply:)];
//    UIMenuItem* report = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(report:)];
//    menu.menuItems = @[ding];
    
    [menu setTargetRect:self.bounds inView:self];
    [menu setMenuVisible:YES animated:YES];
    
}


- (BOOL)canBecomeFirstResponder{
    
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if ( (action == @selector(copy:) && self.text) // 需要有文字才能支持复制
        || (action == @selector(cut:) && self.text) // 需要有文字才能支持剪切
        || action == @selector(paste:)) {
        return YES;
    } else {
        return NO;

    }
}


- (void)cut:(UIMenuController *)menu
{
    //UIPasteboard 是可以在应用程序与应用程序之间共享的 \
    (应用程序:你的app就是一个应用程序 比如你的QQ消息可以剪切到百度查找一样)
    // 将label的文字存储到粘贴板
    [UIPasteboard generalPasteboard].string = self.text;
    // 清空文字
    self.text = nil;
}
/** 赋值 */
- (void)copy:(UIMenuController *)menu
{
    // 将label的文字存储到粘贴板
    [UIPasteboard generalPasteboard].string = self.text;
}
/** 粘贴 */
- (void)paste:(UIMenuController *)menu
{
    // 将粘贴板的文字赋值给label
    self.text = [UIPasteboard generalPasteboard].string;
}


@end

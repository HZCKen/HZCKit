//
//  UITableViewCell+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2020/5/19.
//  Copyright © 2020 Ken. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (HZCKit)

/// 给section设置阴影圆角
/// @param radius 圆角
/// @param space 间距
/// @param shadowColor 阴影颜色
/// @param shadowOpacity 阴影透明度
/// @param shadowOffset 阴影偏移
/// @param tableView tableView
/// @param indexPath indexPath
- (void)hzc_cornerCard:(CGFloat)radius space:(CGFloat)space shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowOffset:(CGSize)shadowOffset tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
// 默认黑色阴影 16间距
- (void)hzc_cornerCard:(CGFloat)radio tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END

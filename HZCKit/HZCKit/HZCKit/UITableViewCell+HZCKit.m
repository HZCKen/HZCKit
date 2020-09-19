//
//  UITableViewCell+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2020/5/19.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "UITableViewCell+HZCKit.h"


@implementation UITableViewCell (HZCKit)

- (void)hzc_cornerCard:(CGFloat)radius space:(CGFloat)space shadowColor:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowOffset:(CGSize)shadowOffset tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    // 设置cell 背景色为透明
    self.backgroundColor = UIColor.clearColor;
    // 创建两个layer
    CAShapeLayer *normalLayer = [[CAShapeLayer alloc] init];
    CAShapeLayer *selectLayer = [[CAShapeLayer alloc] init];
    // 获取显示区域大小
    CGRect bounds = CGRectMake(space, 0, self.frame.size.width - (space * 2), self.frame.size.height);
    // cell的backgroundView
    UIView *normalBgView = [[UIView alloc] initWithFrame:bounds];
    // 获取每组行数
    NSInteger rowNum = [tableView numberOfRowsInSection:indexPath.section];
    // 贝塞尔曲线
    UIBezierPath *bezierPath = nil;
    
    if (rowNum == 1) {
        // 一组只有一行（四个角全部为圆角）
        bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
        normalBgView.clipsToBounds = NO;
    }else {
        normalBgView.clipsToBounds = YES;
        if (indexPath.row == 0) {
            normalBgView.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(-5, 0, 0, 0));
            CGRect rect = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(5, 0, 0, 0));
            // 每组第一行（添加左上和右上的圆角）
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(radius, radius)];
        }else if (indexPath.row == rowNum - 1) {
            normalBgView.frame = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 0, -5, 0));
            CGRect rect = UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 0, 5, 0));
            // 每组最后一行（添加左下和右下的圆角）
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(radius, radius)];
        }else {
            // 每组不是首位的行不设置圆角
            bezierPath = [UIBezierPath bezierPathWithRect:bounds];
        }
    }
    
    // 阴影
    normalLayer.shadowColor = shadowColor.CGColor;
    normalLayer.shadowOpacity = shadowOpacity;
    normalLayer.shadowOffset = shadowOffset;
    normalLayer.path = bezierPath.CGPath;
    normalLayer.shadowPath = bezierPath.CGPath;
    
    // 把已经绘制好的贝塞尔曲线路径赋值给图层，然后图层根据path进行图像渲染render
    normalLayer.path = bezierPath.CGPath;
    selectLayer.path = bezierPath.CGPath;
    
    // 设置填充颜色
    normalLayer.fillColor = [UIColor whiteColor].CGColor;
    // 添加图层到nomarBgView中
    [normalBgView.layer insertSublayer:normalLayer atIndex:0];
    normalBgView.backgroundColor = UIColor.clearColor;
    self.backgroundView = normalBgView;
    
    //         替换cell点击效果
    UIView *selectBgView = [[UIView alloc] initWithFrame:bounds];
    selectLayer.fillColor = [UIColor colorWithWhite:0.95 alpha:1.0].CGColor;
    [selectBgView.layer insertSublayer:selectLayer atIndex:0];
    selectBgView.backgroundColor = UIColor.clearColor;
    self.selectedBackgroundView = selectBgView;

}

- (void)hzc_cornerCard:(CGFloat)radius tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    [self hzc_cornerCard:radius space:16 shadowColor:[UIColor blackColor] shadowOpacity:0.2 shadowOffset:CGSizeMake(0, 0) tableView:tableView indexPath:indexPath];
}

@end

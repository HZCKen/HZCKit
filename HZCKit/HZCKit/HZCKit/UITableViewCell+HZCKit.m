//
//  UITableViewCell+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2020/5/19.
//  Copyright © 2020 Ken. All rights reserved.
//

#import "UITableViewCell+HZCKit.h"


@implementation UITableViewCell (HZCKit)
- (void)hzc_cornerCard:(CGFloat)radio tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    UIRectCorner corner = [self hzc_checkCellIndexPath:indexPath tableView:tableView];
    CGRect contentBounds = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.bounds = contentBounds;
    layer.position = CGPointMake(CGRectGetMidX(contentBounds), CGRectGetMidY(contentBounds));
    layer.path = [UIBezierPath bezierPathWithRoundedRect:contentBounds byRoundingCorners:corner  cornerRadii:CGSizeMake(radio, radio)].CGPath;

    self.layer.mask = layer;

}

- (UIRectCorner)hzc_checkCellIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView {
    
    
    if (indexPath.row == 0 &&
        indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
//       只有一行
        return UIRectCornerAllCorners;
    } else if (indexPath.row == 0) {
//        每组第一行
        return UIRectCornerTopLeft | UIRectCornerTopRight;
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
//        每组最后一行
        return UIRectCornerBottomLeft | UIRectCornerBottomRight;
    } else {
        return 0;
    }
    
}
@end

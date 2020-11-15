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

- (void)hzc_cornerCard:(CGFloat)radio space:(CGFloat)space tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END

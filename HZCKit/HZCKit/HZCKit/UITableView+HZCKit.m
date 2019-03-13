//
//  UITableView+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2019/3/13.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "UITableView+HZCKit.h"

@implementation UITableView (HZCKit)

- (void)hzc_registerNibName:(NSString *)nibName forCellReuseIdentifier:(NSString *)identifier {
    
    [self registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:identifier];
    
}
@end

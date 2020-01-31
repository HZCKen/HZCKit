//
//  HZCKit.h
//  HZCKit
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+HZCKit.h"
#import "UILabel+HZCKit.h"
#import "UIColor+HZCKit.h"
#import "NSString+HZCKit.h"
#import "NSMutableAttributedString+HZCKit.h"
#import "NSAttributedString+HZCKit.h"
#import "NSObject+HZCKit.h"
#import "UIView+HZCKit.h"
#import "UITableView+HZCKit.h"
#import "UISearchBar+HZCKit.h"
#import "UIButton+HZCKit.h"
#import "NSData+HZCKit.h"
#import "UINavigationBar+HZCKit.h"
#import "UIImageView+HZCKit.h"

#define IPHONE_X \
({BOOL isIphoneX = NO; \
if ([UIDevice currentDevice].systemVersion.floatValue >= 11.0) {\
  isIphoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isIphoneX);})

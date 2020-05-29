//
//  AYSIotAlertButtonConfigure.h
//  HZCKit
//
//  Created by Apple on 2020/5/28.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AYSIotAlertButtonConfigure : NSObject
/**  */
@property (nonatomic, copy) NSString *title;

/** <#Description#> */
@property (nonatomic, strong) UIColor *titleColor;

/** <#Description#> */
@property (nonatomic, strong) UIColor *backgroudColor;
@end

NS_ASSUME_NONNULL_END

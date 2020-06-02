//
//  AYSIotRoomLabel.h
//  HZCKit
//
//  Created by Apple on 2020/5/22.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AYSIotRoomLabel : UILabel

/** <#Description#> */
@property (nonatomic, copy) void (^touch)(void);

@property (nonatomic, assign) CGFloat scale;

- (instancetype)initWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END

//
//  CustomSwitchView.h
//  HZCKit
//
//  Created by Apple on 2020/5/22.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomSwitchView : UIView

/** <#Description#> */
@property (nonatomic, assign) BOOL isOn;

/** <#Description#> */
@property (nonatomic, copy) void (^switchVauleChange)(BOOL isOn);

@end

NS_ASSUME_NONNULL_END

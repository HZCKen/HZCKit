//
//  AYSIotSliderView.h
//  HZCKit
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AYSIotLightSliderView : UIView

//当前百分比
@property (assign, nonatomic) CGFloat currentPercent;
//进度条颜色
@property (strong, nonatomic) UIColor *progressColor;

/** <#Description#> */
@property (nonatomic, copy) void (^beginDrag)(void);
/** <#Description#> */
@property (nonatomic, copy) void (^endDrag)(CGFloat percent);
/** <#Description#> */
@property (nonatomic, copy) void (^changeDrag)(CGFloat percent);
/** <#Description#> */
@property (nonatomic, copy) void (^touch)(CGFloat percent);
@end

NS_ASSUME_NONNULL_END

//
//  AYSIotWindowSliderView.h
//  HZCKit
//
//  Created by Apple on 2020/5/25.
//  Copyright © 2020 Ken. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AYSIotCurtainSliderView : UIView
//当前关闭百分比
@property (assign, nonatomic) CGFloat currentPercent;

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

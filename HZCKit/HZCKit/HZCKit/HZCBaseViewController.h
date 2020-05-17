//
//  HZCBaseViewController.h
//  HZCKit
//
//  Created by Ken on 2020/5/16.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZCBaseViewController : UIViewController
@property (nonatomic ,assign)BOOL      isHiddenBackBtn;     //隐藏返回按钮
@property (nonatomic ,assign)BOOL      isHiddenNavBar;     //隐藏导航栏
@property (nonatomic ,copy)NSString    *baseTitle;        //标题
@property (nonatomic, strong) UIColor  *baseTitleColor;   //标题颜色
@property (nonatomic ,copy)NSString    *leftImageName;
@property (nonatomic ,copy)NSString    *leftTitleName;
@property (nonatomic ,copy)NSString    *rightImageName;
@property (nonatomic ,copy)NSString    *rigthTitleName;
@property (nonatomic, copy)NSString    *rightBackgroupImage;
/** 是否可以手势返回 */
@property (nonatomic, assign) BOOL isGestureBack;

@property (nonatomic, strong) UIView *navgateView;   //导航栏

@property (nonatomic, assign) BOOL      rightBtnEnabled;    // 右按钮是否可点击

/** 成功Pop，包括点击返回和手势返回 */
@property (nonatomic, copy) void (^successPop)(void);

- (void)setleftImage:(NSString *)image;

-(void)leftButtonAction;
-(void)rightButtonAction;


- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END

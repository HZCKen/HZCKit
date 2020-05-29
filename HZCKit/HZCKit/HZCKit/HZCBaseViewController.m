//
//  HZCBaseViewController.m
//  HZCKit
//
//  Created by Ken on 2020/5/16.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "HZCBaseViewController.h"

#define isIPhoneX ({\
BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
if ([[[UIApplication sharedApplication] delegate] window].safeAreaInsets.bottom > 0.0) {\
isPhoneX = YES;\
}\
}\
isPhoneX;\
})


#define KTabbarSafeBottomMargin      (isIPhoneX ? 34.f : 0.f)
#define kNewNavHeight     (isIPhoneX ? 88 : 64)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define KStatusHeight     (isIPhoneX ? 44 : 20)

@interface HZCBaseViewController () <UIAlertViewDelegate> {
    UIButton      *backBtn;
    UILabel       *titleLabel;
    UIButton      *rightBtn;
}



@end

@implementation HZCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    //ScrollView莫名其妙不能在viewController划到,加上这句解决
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled=YES;
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
    self.isGestureBack = YES;
    [self.navigationController setNavigationBarHidden:YES];

    [self customNavBar];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
//    [SVProgressHUD dismiss];
//
//    [MobClick endLogPageView:self.baseTitle];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    [MobClick beginLogPageView:self.baseTitle];
}

#pragma mark --Response
#pragma mark 返回方法
-(void)leftButtonAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 导航栏右侧按钮事件
-(void)rightButtonAction{
    
}

#pragma mark --setters and getters
#pragma mark 隐藏导航栏
-(void)setIsHiddenNavBar:(BOOL)isHiddenNavBar{
    _isHiddenNavBar=isHiddenNavBar;
    self.navgateView.hidden=isHiddenNavBar;
}

#pragma mark 隐藏返回按钮
-(void)setIsHiddenBackBtn:(BOOL)isHiddenBackBtn{
    _isHiddenBackBtn=isHiddenBackBtn;
    backBtn.hidden=isHiddenBackBtn;
}
#pragma mark ====== 右按钮是否可以点击 =======
- (void)setRightBtnEnabled:(BOOL)rightBtnEnabled{
    rightBtn.enabled = rightBtnEnabled;
}

#pragma makr 设置导航栏左侧按钮图片
-(void)setLeftImageName:(NSString *)leftImageName{
    _leftImageName=leftImageName;
    if (_leftImageName) {
        backBtn.hidden=NO;
        [backBtn setImage:[UIImage imageNamed:_leftImageName] forState:UIControlStateNormal];
        [backBtn setImageEdgeInsets:UIEdgeInsetsZero];
    }
}
- (void)setleftImage:(NSString *)image{
    backBtn.hidden=NO;
    [backBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsZero];
}
#pragma mark 设置导航栏左侧按钮文字
- (void)setLeftTitleName:(NSString *)leftTitleName{
    _leftTitleName = leftTitleName;
    [backBtn setTitle:leftTitleName forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] forState:UIControlStateNormal];
    backBtn.titleLabel.font=[UIFont systemFontOfSize:17];
    backBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
//    [backBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [backBtn setImage:nil forState:UIControlStateNormal];
}

#pragma mark 设置导航栏右侧按钮图片
-(void)setRightImageName:(NSString *)rightImageName{
    _rightImageName=rightImageName;
    [rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
}
- (void)setRightBackgroupImage:(NSString *)rightBackgroupImage{
    _rightBackgroupImage = rightBackgroupImage;
    [rightBtn setImage:[UIImage imageNamed:rightBackgroupImage] forState:UIControlStateNormal];
}

#pragma mark 设置导航栏右侧按钮文字
-(void)setRigthTitleName:(NSString *)rigthTitleName{
    _rigthTitleName=rigthTitleName;
    [rightBtn setTitle:rigthTitleName forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] forState:UIControlStateNormal];
    if (rigthTitleName.length>=4) {
        
        CGSize size = [self sizeWithLabelWidth:kScreenWidth font:[UIFont systemFontOfSize:16] WithString:rigthTitleName];
        
        rightBtn.frame = CGRectMake(kScreenWidth-size.width-5,KStatusHeight +2, size.width, 40);
    }
    rightBtn.titleLabel.font=[UIFont systemFontOfSize:16];
    rightBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
}

#pragma mark 设置标题
-(void)setBaseTitle:(NSString *)baseTitle{
    _baseTitle=baseTitle;
    titleLabel.text=baseTitle;
}
- (void)setBaseTitleColor:(UIColor *)baseTitleColor{
    _baseTitleColor = baseTitleColor;
    titleLabel.textColor = baseTitleColor;
}

#pragma mark 设置状态栏样式
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark --Private Methods
#pragma mark 自定义导航栏
-(void)customNavBar{
    self.navgateView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNewNavHeight)];
    self.navgateView.backgroundColor= [UIColor whiteColor];
    [self.view addSubview:self.navgateView];
    
    backBtn=[[UIButton alloc] initWithFrame:CGRectMake(5,KStatusHeight + 2, 40, 40)];
//    [backBtn setImage:[UIImage drawImageWithName:@"back.png"size:CGSizeMake(12, 19)] forState:UIControlStateNormal];
    
    [backBtn setImage:[UIImage imageNamed:@"nav_btn_back_gray"] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0,-10.0, 0, 0)];
    [backBtn addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navgateView addSubview:backBtn];
    
    titleLabel =[[UILabel alloc] initWithFrame:CGRectMake((kScreenWidth-180)/2, KStatusHeight, 180, 44)];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.textColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    titleLabel.font=[UIFont boldSystemFontOfSize:18];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.navgateView addSubview:titleLabel];
    
    rightBtn=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-45, KStatusHeight+2, 40, 40)];
    [rightBtn addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.navgateView addSubview:rightBtn];
    
    self.navgateView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.08].CGColor;
    self.navgateView.layer.shadowOffset = CGSizeMake(0,3);
    self.navgateView.layer.shadowOpacity = 1;
    self.navgateView.layer.shadowRadius = 10;

}
#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.isGestureBack;
}

- (void)willMoveToParentViewController:(UIViewController *)parent{
    [super willMoveToParentViewController:parent];
//    NSLog(@"%s,%@",__FUNCTION__,parent);
}
- (void)didMoveToParentViewController:(UIViewController *)parent{
    [super didMoveToParentViewController:parent];
//    NSLog(@"%s,%@",__FUNCTION__,parent);
    if(!parent){
//        NSLog(@"页面pop成功了");
        if (self.successPop) {
            self.successPop();
        }
    }
}

#pragma mark --自定义弹出框
- (void)showAlertWithTitle:(NSString *)title Message:(NSString *)message {
//    NSString *otherButtonTitle = NSLocalizedString(@"确定", nil);
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//
//    }];
//    [alertController addAction:otherAction];
//    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark --简单计算文本宽度
- (CGSize)sizeWithLabelWidth:(CGFloat)width font:(UIFont *)font WithString:(NSString *)String{
    NSDictionary *dict=@{NSFontAttributeName : font};
    CGRect rect=[String boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dict context:nil];
    CGFloat sizeWidth=ceilf(CGRectGetWidth(rect));
    CGFloat sizeHieght=ceilf(CGRectGetHeight(rect));
    return CGSizeMake(sizeWidth, sizeHieght);
}


- (void)dealloc{
    
}

@end

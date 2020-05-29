//
//  ViewController1.m
//  HZCKit
//
//  Created by Ken on 2020/5/16.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController3.h"
#import "ViewController2.h"
#import "HZCKit.h"

#import "AYSIotCustomSwitchView.h"
#import "AYSIotLightSliderView.h"
#import "AYSIotCurtainSliderView.h"
#import "AYSIotSliderView.h"
#import "AYSIotWindowSliderView.h"

#import "AYSIotCustomTextFieldAlertView.h"
#import "ScottAlertController.h"

#import "AYSIotAlertTool.h"
#import "Masonry.h"
@interface ViewController1 ()
/** <#Description#> */
@property (nonatomic, strong) UIView *bcView;
/** <#Description#> */
@property (nonatomic, strong) AYSIotLightSliderView *sliderView;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    button.frame = CGRectMake(59, 64, 100, 100);
//    [button setBackgroundColor:[UIColor blueColor]];
//    button.layer.cornerRadius = 10;
//    [button hzc_shadowPathWithColor:[UIColor redColor] shadowOpacity:1 shadowRadius:10 shadowPathType:kShadowPathAround shadowPathWidth:10];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(clickButton) forControlEvents:(UIControlEventTouchUpInside)];
//
//    UIView *bcView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
//    [self.view addSubview:bcView];
//    self.bcView = bcView;
//    bcView.backgroundColor = [UIColor brownColor];
//    [self.bcView hzc_shadowPathWithColor:[UIColor greenColor] shadowOpacity:1 shadowRadius:10 shadowPathType:kShadowPathAround shadowPathWidth:10];
//    
//    UILabel *label = [[UILabel alloc] init];
//    [self.view addSubview:label];

//    CustomSwitchView *switchView = [[CustomSwitchView alloc] init];
////    switchView.frame = CGRectMake(197.7,300,47,22);
////    switchView.layer.cornerRadius = 7.3;
//    [self.view addSubview:switchView];
//
//
//    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(47);
//        make.height.mas_equalTo(22);
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.centerY.equalTo(self.view.mas_centerY);
//    }];
//
//    [switchView setSwitchVauleChange:^(BOOL isOn) {
//        NSLog(@"%d", isOn);
//    }];
//
    
//    [self testLightSliderView];
//    [self testCurtainSliderView];
//    [self testSliderView];
//    [self testWidowSliderView];
//    UIView *view1 = [[UIView alloc] init];
//    view1.frame = CGRectMake(53,180,207.8,142.2);
//    view1.backgroundColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1.0];
//    view1.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1].CGColor;
//    view1.layer.shadowOffset = CGSizeMake(0,10);
//    view1.layer.shadowOpacity = 1;
//    view1.layer.shadowRadius = 15;
//    view1.layer.cornerRadius = 8;
//    [self.view addSubview:view1];
    
//    AYSIotCustomAlertView *customAlert = [AYSIotCustomAlertView customAlertView];
////    customAlert.frame = CGRectMake(100, 100, 268, 185);
//    [self.view addSubview:customAlert];
//
//    [customAlert mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(268);
//        make.height.mas_equalTo(185);
//        make.top.mas_equalTo(100);
//        make.centerX.equalTo(self.view.mas_centerX);
//    }];
//
//
//    NSLog(@"%@", NSStringFromCGRect(customAlert.frame));
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    button.frame = CGRectMake(50, 100, 50, 50);
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
}

- (void)clickButton:(UIButton *)sender {
    
    
    [AYSIotAlertTool showMessageAlert:self text:@"解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功"];
    
//    AYSIotAlertButtonConfigure *left = [[AYSIotAlertButtonConfigure alloc] init];
//    left.title = @"解绑";
//    left.titleColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
//    left.backgroudColor = [UIColor whiteColor];
//
//    AYSIotAlertButtonConfigure *right = [[AYSIotAlertButtonConfigure alloc] init];
//    right.title = @"不解绑";
//    right.titleColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
//    right.backgroudColor = [UIColor redColor];
//
//    [AYSIotAlertTool showTwoButtonAlert:self title:@"温馨提示" message:@"设备解绑后将不可再对设备进行操作，是否确定解绑。" leftButtonConfigure:left rightButtonConfigure:right leftHandle:^{
//        NSLog(@"left");
//    } rightHandle:^{
//        NSLog(@"right");
//    } closeHandle:^{
//        NSLog(@"close");
//    }];
    
//    [AYSIotAlertTool showDefaultTwoButtonAlert:self title:@"温馨提示" message:@"设备解绑后将不可再对设备进行操作，是否确定解绑。" confirm:^{
//        NSLog(@"确定");
//    } cancel:^{
//        NSLog(@"取消");
//    }];
    
//    [AYSIotAlertTool showIotTextField:self title:@"修改网关名称" message:@"当前网关名称是-APP测试" placeholder:@"请输入新的网关名称" isSecureTextEntry:NO keyboardType:(UIKeyboardTypeDefault) confirm:^(NSString * _Nonnull text) {
//        NSLog(@"%@", text);
//    } cancel:^{
//        NSLog(@"取消");
//    }];
    
}

- (void)testWidowSliderView {
    AYSIotWindowSliderView *sliderView = [[AYSIotWindowSliderView alloc] init];
    [self.view addSubview:sliderView];
    sliderView.backgroundColor = [UIColor clearColor];
    
    [sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(self.view);
        make.height.mas_equalTo(260);
    }];
    sliderView.currentPercent = 0.4;
}

- (void)testSliderView {
    AYSIotSliderView *sliderView = [[AYSIotSliderView alloc] init];
    sliderView.backgroundColor = [UIColor lightGrayColor];
    sliderView.progressColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1.0];
    sliderView.layer.cornerRadius = 12;
    
    [self.view addSubview:sliderView];
    
    [sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(200);
    }];
    
    sliderView.currentPercent = 0.2;
    
    [sliderView setBeginDrag:^{
        NSLog(@"%s", __FUNCTION__);
    }];
    
    [sliderView setChangeDrag:^(CGFloat percent) {
        //        NSLog(@"chang %lf", percent);
    }];
    
    [sliderView setEndDrag:^(CGFloat percent) {
        NSLog(@"end %lf", percent);
    }];
    
    [sliderView setTouch:^(CGFloat percent) {
        NSLog(@"touch %lf", percent);
    }];
    
}

- (void)testCurtainSliderView {
    AYSIotCurtainSliderView *window = [[AYSIotCurtainSliderView alloc] init];
    window.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0];
    window.layer.cornerRadius = 8;
    [self.view addSubview:window];
    [window mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(162);
    }];
}

- (void)testLightSliderView {
        AYSIotLightSliderView *sliderView = [[AYSIotLightSliderView alloc] init];
        sliderView.backgroundColor = [UIColor lightGrayColor];
        sliderView.progressColor = [UIColor colorWithRed:44/255.0 green:99/255.0 blue:216/255.0 alpha:1.0];
        sliderView.layer.cornerRadius = 12;
        
        [self.view addSubview:sliderView];
        
        [sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view.mas_centerY);
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(200);
        }];
        
        sliderView.currentPercent = 0.2;
        self.sliderView = sliderView;
        
        [sliderView setBeginDrag:^{
           NSLog(@"%s", __FUNCTION__);
        }];
        
        [sliderView setChangeDrag:^(CGFloat percent) {
    //        NSLog(@"chang %lf", percent);
        }];
        
        [sliderView setEndDrag:^(CGFloat percent) {
            NSLog(@"end %lf", percent);
        }];
        
        [sliderView setTouch:^(CGFloat percent) {
            NSLog(@"touch %lf", percent);
        }];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

int count = 1;
- (void)clickButton {
    
    
    
    
    count += 1;

    if (count == 5) {
        count = 1;
    }
    
//    ViewController3 *vc3 = [[ViewController3 alloc] init];
//    vc3.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc3 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

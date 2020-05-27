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

#import "CustomSwitchView.h"

#import "AYSIotLightSliderView.h"
#import "AYSIotCurtainSliderView.h"
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
    
    [self testSliderView];
//    [self testCurtainSliderView];

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

- (void)testSliderView {
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
    self.sliderView.currentPercent = 0.03;
    
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

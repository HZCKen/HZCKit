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
@interface ViewController1 ()
/** <#Description#> */
@property (nonatomic, strong) UIView *bcView;
@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    button.frame = CGRectMake(59, 64, 100, 100);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickButton) forControlEvents:(UIControlEventTouchUpInside)];

    UIView *bcView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    [self.view addSubview:bcView];
    self.bcView = bcView;
    bcView.backgroundColor = [UIColor brownColor];
    [self.bcView hzc_shadowPathWithColor:[UIColor greenColor] shadowOpacity:1 shadowRadius:10 shadowPathType:kShadowPathAround shadowPathWidth:10];
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

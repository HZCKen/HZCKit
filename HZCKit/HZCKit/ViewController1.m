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
@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor brownColor];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    button.frame = CGRectMake(59, 64, 100, 100);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickButton) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)clickButton {
    
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    vc3.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc3 animated:YES];
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

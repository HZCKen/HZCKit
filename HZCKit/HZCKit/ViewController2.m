//
//  ViewController2.m
//  HZCKit
//
//  Created by Ken on 2020/5/16.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "ViewController2.h"
#import "HZCKit.h"
#import "Masonry.h"
@interface ViewController2 () <UITableViewDelegate, UITableViewDataSource>

/** <#Description#> */
@property (nonatomic, strong) UITableView *tableView;

/** <#Description#> */
@property (nonatomic, strong) UIView *testview;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setSuccessPop:^{
        NSLog(@"返回");
    }];
    self.isHiddenBackBtn = YES;
    [self setLeftTitleName:@"返回"];
    
    self.testview = [[UIView alloc] init];
    [self.view addSubview:self.testview];
    [self.testview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(100);
    }];
    
    self.testview.backgroundColor = UIColor.redColor;
    
    
    
    
//    [self.view addSubview:self.tableView];
//
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.navgateView.mas_bottom).offset(10);
//        make.leading.trailing.bottom.equalTo(self.view);
////        make.leading.equalTo(self.view).offset(16);
////        make.trailing.equalTo(self.view).offset(-16);
////        make.bottom.equalTo(self.view).offset(16);
//    }];
    
    
//    [test hzc_shadowPathWithColor:[UIColor redColor] shadowOpacity:0.1 shadowRadius:8 shadowPathType:(kShadowPathAround) shadowPathWidth:1];
//    [self p_setupSubViews];
}

- (void)p_setupSubViews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self p_setupViewWithY:100 shadowColor:[UIColor redColor]];
    [self p_setupViewWithY:170 shadowColor:[UIColor blueColor]];
    [self p_setupViewWithY:240 shadowColor:[UIColor yellowColor]];
}

- (void)p_setupViewWithY:(CGFloat)y shadowColor:(UIColor *)shadowColor {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, y, [UIScreen mainScreen].bounds.size.width - 60, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    view.layer.shadowOpacity = 1;
    view.layer.shadowColor = shadowColor.CGColor;
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.testview hzc_shadowPathWithColor:UIColor.blueColor shadowOpacity:1 shadowRadius:10 shadowPathType:kShadowPathTop shadowPathWidth:10];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return  3;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell hzc_cornerCard:10 tableView:tableView indexPath:indexPath];
    
}



//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 44;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
    }
    return _tableView;
}

@end

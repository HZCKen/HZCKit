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
#import "AYSIotRoomLabel.h"
#import "AYSIotCustomTextFieldAlertView.h"
#import "ScottAlertController.h"
#import "AYSIotRoomCollectionViewCell.h"
#import "AYSIotAlertTool.h"
#import "Masonry.h"
@interface ViewController1 ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** <#Description#> */
@property (nonatomic, strong) UIView *bcView;
/** <#Description#> */
@property (nonatomic, strong) AYSIotLightSliderView *sliderView;
/** <#Description#> */
@property (nonatomic, strong) UIScrollView *scrollView;
/** <#Description#> */
@property (nonatomic, strong) UIView *lineView;
/** <#Description#> */
@property (nonatomic, assign) NSInteger currentIndex;

/** <#Description#> */
@property (nonatomic, strong) NSArray *datas;

/** <#Description#> */
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic)  UICollectionViewFlowLayout *layout;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *datas = @[@"客厅", @"儿童房", @"客厅",@"客厅",@"健身室", @"厨房" ];
    self.datas = datas;

    
    [self testscrollView];
    self.layout = [[UICollectionViewFlowLayout alloc] init];
      
      self.collectionView  = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 300) collectionViewLayout:self.layout];
      [self.collectionView registerClass:[AYSIotRoomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
      [self.view addSubview:self.collectionView];
      self.collectionView.dataSource = self;
      self.collectionView.delegate = self;
      [self.collectionView reloadData];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self setupLayout];
}

/**
 *  设置布局
 */
-(void)setupLayout
{
    self.layout.itemSize = self.collectionView.bounds.size;

    NSLog(@"%@",NSStringFromCGRect(self.collectionView.bounds));

    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.layout.minimumLineSpacing = 0;

    self.layout.minimumInteritemSpacing = 0;

    self.collectionView.pagingEnabled = YES;

    self.collectionView.bounces = NO;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.datas = @[@"1",@"2"];
//         [self testscrollView];
//    });
}

- (void)testscrollView {

    if ([self.view.subviews containsObject:self.scrollView]) {
        [self.scrollView removeFromSuperview];
    }

    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    scrollView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width - 80, 40);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;


    CGFloat labelx = 32;
    NSInteger index = 0;
    for (NSString *room in self.datas) {
        AYSIotRoomLabel *label = [[AYSIotRoomLabel alloc] initWithText:room];
        __weak typeof(label) weakLabel = label;
        [label setTouch:^{
            if (weakLabel.tag == self.currentIndex) {
                return ;
            }
            weakLabel.scale = 1;
            AYSIotRoomLabel *currentLable = self.scrollView.subviews[self.currentIndex];
            currentLable.scale = 0;
            self.currentIndex = weakLabel.tag;
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:0];
            //滑动指定item
            [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
            [self scrollViewContentOffset];
        }];
        [scrollView addSubview:label];
        label.frame = CGRectMake(labelx, 0, label.bounds.size.width, 40);
        labelx += label.frame.size.width+32;
        label.tag = index;
        index ++;
    }

    scrollView.contentSize = CGSizeMake(labelx, 40);

    self.currentIndex = 0;
    AYSIotRoomLabel * channelLabel = self.scrollView.subviews[self.currentIndex];
    channelLabel.scale = 1;


    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 30, 20, 2)];
    self.lineView.backgroundColor = [UIColor redColor];
    self.lineView.center = CGPointMake(channelLabel.center.x, self.scrollView.frame.size.height - self.lineView.frame.size.height);
    [self.scrollView addSubview:self.lineView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AYSIotRoomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - UICollectionViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

//    //获取可视范围的 items 的indexPath 数组
    NSArray * indexPatchs = [self.collectionView indexPathsForVisibleItems];
//
    AYSIotRoomLabel * currentLabel = self.scrollView.subviews[self.currentIndex];

    AYSIotRoomLabel * nextLabel = nil;

    if (![currentLabel isKindOfClass:[AYSIotRoomLabel class]]) {
        return;
    }

    for (NSIndexPath *indexPath in indexPatchs) {
        if (indexPath.item != self.currentIndex) {
            nextLabel = self.scrollView.subviews[indexPath.item];
            break;
        }
    }
    NSInteger offsetX = scrollView.contentOffset.x;

    //计算缩放比
    CGFloat nextScale = (CGFloat)offsetX / scrollView.frame.size.width - self.currentIndex;

    CGFloat currentScale = 1 - nextScale;

    currentLabel.scale = currentScale;

    nextLabel.scale = nextScale;

//    NSLog(@"当前 %f 下一个 %f offsetx %lf",currentScale,nextScale, (CGFloat)offsetX / scrollView.frame.size.width);
    self.currentIndex = offsetX / scrollView.frame.size.width;

    // 宽度变化
    CGFloat moveW = (nextLabel.frame.size.width - currentLabel.frame.size.width) *nextScale;
    // X的改变值
    CGFloat moveX =(nextLabel.frame.origin.x - currentLabel.frame.origin.x) * nextScale + 0.25;
    CGFloat lineX = currentLabel.frame.origin.x + moveX ;
    CGFloat lineY = self.lineView.frame.origin.y;
    CGFloat lineW = currentLabel.frame.size.width + moveW;
    CGFloat lineH = self.lineView.frame.size.height;
    self.lineView.frame = CGRectMake(lineX, lineY, lineW, lineH);
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewContentOffset];

    for (UIView *view in self.scrollView.subviews) {
        if (self.currentIndex != view.tag) {
            if ([view isKindOfClass:[AYSIotRoomLabel class]]) {
                AYSIotRoomLabel *label = (AYSIotRoomLabel *)view;
                label.scale = 0;
            }
        }
    }

}

//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    [self.selectView endDecelerating];
//}

-(void)scrollViewContentOffset {

    AYSIotRoomLabel * label = self.scrollView.subviews[self.currentIndex];

    CGFloat offsetX = label.center.x - self.view.center.x;

    CGFloat maxOffsetX = self.scrollView.contentSize.width - self.scrollView.bounds.size.width;

    if (offsetX <0) {
        offsetX = 0;
    } else if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }

    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.center = CGPointMake(label.center.x, self.scrollView.frame.size.height - self.lineView.frame.size.height);
    }];
    [ self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];

}

- (void)clickButton:(UIButton *)sender {
    
    
//    [AYSIotAlertTool showMessageAlert:self text:@"解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功解绑成功"];
    
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
    
    [AYSIotAlertTool showIotTextField:self title:@"修改网关名称" message:@"当前网关名称是-APP测试" placeholder:@"请输入新的网关名称" isSecureTextEntry:NO keyboardType:(UIKeyboardTypeDefault) confirm:^(NSString * _Nonnull text) {
        NSLog(@"%@", text);
    } cancel:^{
        NSLog(@"取消");
    }];
    
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

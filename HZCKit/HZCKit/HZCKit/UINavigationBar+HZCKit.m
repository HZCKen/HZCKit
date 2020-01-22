//
//  UINavigationBar+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2020/1/22.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//
// 出处为 https://www.jianshu.com/p/a08f6c727a43 
#import "UINavigationBar+HZCKit.h"
#import <objc/runtime.h>

@class HZCCustomNavView;

@interface UINavigationBar()
@property (nonatomic, strong) UIImage       *backClearImage;
@property (nonatomic, strong) UIImage       *lineClearImage;
@property (nonatomic, strong) HZCCustomNavView     *customNavView; //自定义插入层，自定义操作都要在这一层上进行
@property (nonatomic, assign) BOOL          hiddenBottom;
@end

static char backClear_key, lineClear_key, HZCCustomNavView_key, hiddenBottom_key;

@implementation UINavigationBar (HZCKit)

#pragma mark -- runtime:get/set
- (void)setBackClearImage:(UIImage *)backClearImage {
    objc_setAssociatedObject(self, &backClear_key, backClearImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)backClearImage {
    return objc_getAssociatedObject(self, &backClear_key);
}

- (void)setLineClearImage:(UIImage *)lineClearImage {
    objc_setAssociatedObject(self, &lineClear_key, lineClearImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)lineClearImage {
    return objc_getAssociatedObject(self, &lineClear_key);
}

- (void)setCustomNavView:(HZCCustomNavView *)customNavView {
    objc_setAssociatedObject(self, &HZCCustomNavView_key, customNavView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HZCCustomNavView *)customNavView {
    return objc_getAssociatedObject(self, &HZCCustomNavView_key);
}

- (void)setHiddenBottom:(BOOL)hiddenBottom {
    objc_setAssociatedObject(self, &hiddenBottom_key, @(hiddenBottom), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hiddenBottom {
    return [objc_getAssociatedObject(self, &hiddenBottom_key) boolValue];
}

#pragma mark -- function
- (void)hzc_navBarAlpha:(CGFloat)alpha isOpaque:(BOOL)opaque {
    [self hzc_clearSystemLayerIsOpaque:opaque];
    if (!self.customNavView) {
        //状态栏高度
        CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        //导航栏高度
        CGFloat barHeight = self.bounds.size.height;
        CGRect barBounds = self.bounds;
        barBounds.size.height = statusHeight + barHeight;
        self.customNavView = [[HZCCustomNavView alloc]initWithFrame:barBounds];
        [self hzc_navBarBottomLineHidden:self.hiddenBottom];
    }
    
    self.customNavView.alpha = alpha;
    
    //通过kvc找到系统导航栏背景层，把自定义层添加到背景层
    /* 系统背景层无法改变其属性 所以通过添加自定义层，改变自定义层去实现效果*/
    [[self valueForKey:@"backgroundView"] addSubview:self.customNavView];
}

- (void)hzc_navBarBackGroundColor:(UIColor *)color image:(UIImage *)barImage isOpaque:(BOOL)opaque {
    [self hzc_clearSystemLayerIsOpaque:opaque];
    if (!self.customNavView) {
        //状态栏高度
        CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        //导航栏高度
        CGFloat barHeight = self.bounds.size.height;
        
        CGRect barBounds = self.bounds;
        barBounds.size.height = statusHeight + barHeight;
        
        self.customNavView = [[HZCCustomNavView alloc]initWithFrame:barBounds];
        [self hzc_navBarBottomLineHidden:self.hiddenBottom];
    }
    
    if (color) {
        self.customNavView.backColor = color;
    }
    
    if (barImage) {
        self.customNavView.backImage = barImage;
    }
    
    //通过kvc找到系统导航栏背景层，把自定义层添加到背景层
    /*系统背景层无法改变其属性 所以通过添加自定义层，改变自定义层上的属性去实现效果*/
    [[self valueForKey:@"backgroundView"] addSubview:self.customNavView];
}

- (void)hzc_navBarMyLayerHeight:(CGFloat)height isOpaque:(BOOL)opaque {
    height = height < 0 ? 0 : height;
    
    [self hzc_clearSystemLayerIsOpaque:opaque];
    
    if (!self.customNavView) {
        self.customNavView = [[HZCCustomNavView alloc]init];
        [self hzc_navBarBottomLineHidden:self.hiddenBottom];
    }
    [self.customNavView setFrame:CGRectMake(0, 0, self.bounds.size.width, height)];

    //通过kvc找到系统导航栏背景层，把自定义层添加到背景层
    /* 亲测，系统背景层无法改变其属性 所以通过添加自定义层，改变自定义层上的属性去实现效果*/
    [[self valueForKey:@"backgroundView"] addSubview:self.customNavView];
}

- (void)hzc_navBarBottomLineHidden:(BOOL)hidden {
    self.hiddenBottom = hidden;
    //如果是自定义图层
    if (self.customNavView && self.customNavView.hiddenBottomLine != hidden) {
        self.customNavView.hiddenBottomLine = hidden;
        
    } else {
        //如果是系统层
        if (hidden) {
            if (!self.lineClearImage) {
                self.lineClearImage = [[UIImage alloc]init];
                [self setShadowImage:self.lineClearImage];
            }
        } else {
            if (self.lineClearImage) {
                self.lineClearImage = nil;
                [self setShadowImage:self.lineClearImage];
            }
        }
    }
}

//还原到系统初始状态
- (void)hzc_navBarToBeSystem {
    if (self.customNavView) {
        [self.customNavView removeFromSuperview];
        self.customNavView = nil;
    }
    if (self.lineClearImage) {
        self.lineClearImage = nil;
    }
    if (self.backClearImage) {
        self.backClearImage = nil;
    }
    [self setBackgroundImage:nil
               forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:nil];
    self.barStyle = UIBarStyleDefault;
}

//去掉系统导航栏特征
- (void)hzc_clearSystemLayerIsOpaque:(BOOL)opaque{
    //通过插入空image把背景变透明
    if (!self.backClearImage) {
        self.backClearImage = [[UIImage alloc]init];
        [self setBackgroundImage:self.backClearImage
                   forBarMetrics:UIBarMetricsDefault];
    }
    self.barStyle = opaque ? UIBarStyleBlackOpaque : UIBarStyleDefault;
    //去掉系统底线，使用自定义底线
    if (!self.lineClearImage) {
        self.lineClearImage = [[UIImage alloc]init];
        [self setShadowImage:self.lineClearImage];
    }
}
@end

#pragma mark -- 自定义导航栏层
@interface HZCCustomNavView()
@property (nonatomic, strong) UIImageView * _Nullable backImageView;
@property (nonatomic, strong) UIView * _Nullable bottomLine;
@end

@implementation HZCCustomNavView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self creatMainUIByFrame:frame];
}

- (void)creatMainUIByFrame:(CGRect)frame {
    CGFloat height = frame.size.height;
    CGFloat width = frame.size.width;
    [self.backImageView setFrame:CGRectMake(0, 0, width, height)];
    [self addSubview:self.backImageView];
    
    [self.bottomLine setFrame:CGRectMake(0, height-0.5, width, 0.5)];
    [self addSubview:self.bottomLine];
}

//底层背景层永远透明
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [super setBackgroundColor:[UIColor clearColor]];
}

//设置图片背景颜色
- (void)setBackColor:(UIColor *)backColor {
    _backColor = backColor;
    self.backImageView.backgroundColor = backColor;
}

//设置图片背景透明度
- (void)setAlpha:(CGFloat)alpha {
    _alpha = alpha;
    self.backImageView.alpha = alpha;
}

//设置图片
- (void)setBackImage:(UIImage *)backImage {
    _backImage = backImage;
    self.backImageView.image = backImage;
}

- (void)setHiddenBottomLine:(BOOL)hiddenBottomLine {
    _hiddenBottomLine = hiddenBottomLine;
    self.bottomLine.hidden = hiddenBottomLine;
}

#pragma mark -- 懒加载视图
- (UIImageView *)backImageView {
    if (!_backImageView) {
        _backImageView = [UIImageView new];
        _backImageView.clipsToBounds = YES;
        _backImageView.contentMode = UIViewContentModeTop;
    }
    return _backImageView;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [UIView new];
        [_bottomLine setBackgroundColor:[UIColor grayColor]];
    }
    return _bottomLine;
}

@end


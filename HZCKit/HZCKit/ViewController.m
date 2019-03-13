//
//  ViewController.m
//  HZCKit
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "ViewController.h"
#import "HZCKit.h"

#import "testView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"textView %@", [testView hzc_className]);
    testView *test = [testView hzc_loadNib];
    
    [self.view addSubview:test];
//    test.frame = CGRectMake(100, 100, 100, 100);
    
    
//    [self test1];
}

- (void)test1 {
    // Do any additional setup after loading the view, typically from a nib.
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 370, 44)];
//    label.textColor = [UIColor blackColor];
//    [self.view addSubview:label];
//    label.font = [UIFont systemFontOfSize:15];
//    label.numberOfLines = 0;
//
//    NSString *num = @"我是一百";
//    NSString *numString = [num hzc_translatArabicNumberals];
//    label.text = numString;
//
//    bool isChinese = [num hzc_isChineseCharacter];
    
    
//    NSString *info = @"但是公司的高度是广东省公司的广东省高速度来开个大帅哥多撒谎个爱好就跟他说噶三公司噶是的刚好是我哥如果黑暗如果坏都干撒降低公司及嘎斯进欧冠赛欧结果就赛欧国际韶关；可垃圾费；阿尔加两块；三个身高萨嘎干撒的公司的高度上收到公司的公司都给ID搜狗破is打个屁偶是东莞IP手动皮革是滴哦苹果是滴哦苹果度搜皮为欧公司的漂漂是第三个是干撒噶是的噶虽然刚撒旦个撒公司的公司的高度";
//
//
////    NSMutableAttributedString *attStirng = [NSMutableAttributedString hzc_getColorAttributedStringWithString:info rangeOfString:@"公司" textColor:[UIColor redColor]];
////    [attStirng hzc_changeColorRangeOfString:@"但是" textColor:[UIColor blueColor]];
////    [attStirng hzc_changeColorRangeOfString:@"垃圾" textColor:[UIColor blueColor]];
////    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:info];;
////    [attString hzc_changeFontSizeString:@"但是" fontSize:17];
////    [attString hzc_changeFontSizeString:@"垃圾" fontName:@"HelveticaNeue-Bold" fontSize:20];
//    //    NSMutableAttributedString *attString = [NSMutableAttributedString hzc_getFontSizeString:info rangeOfString:@"高度" fontSize:30];
////    NSMutableAttributedString *attString = [NSMutableAttributedString hzc_getFontSizeString:info rangeOfString:@"高度" fontName:@"HelveticaNeue-Bold" fontSize:30];
//    NSAttributedString *attString = [NSAttributedString hzc_strikethroughStyleSingle:info];
//    label.attributedText = attString;
//    [label sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

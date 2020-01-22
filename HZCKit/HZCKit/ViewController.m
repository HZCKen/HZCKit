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
#import "HZCMenuLabel.h"

#import <zlib.h>

@interface ViewController ()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

/** <#Description#> */
@property (nonatomic, strong) UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSString *dataString = @"34FF6E0641523731235514570733F04AEE270004";
//
//
//
//    NSData *data = [dataString hzc_convertHexStrToData];
//
//    unsigned char *bytes = (uint8_t *)[data bytes];
//
//    uint32_t result = L_Checkout_Crc32(bytes, data.length);
//
//    NSLog(@"%@", [NSData hzc_bytesFromUInt32:hzc_Tranverse32(result)]);

    self.button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.button];
    
    [self.button setBackgroundImage:[[UIImage hzc_getImageWithColor:[UIColor purpleColor]] hzc_drawCornerInRect:self.button.bounds corners:(UIRectCornerTopRight | UIRectCornerBottomLeft) cornerRadius:10] forState:(UIControlStateNormal)];
    
//    [self.navigationController.navigationBar hzc_setStatusBarBackgroundColor: [UIColor redColor]];
    [self.navigationController.navigationBar hzc_navBarBackGroundColor:[UIColor brownColor] image:nil isOpaque:YES];
}


//CRC32校验表
uint32_t Crc32Table[] =
{
    0x00000000,0x04C11DB7,0x09823B6E,0x0D4326D9,0x130476DC,0x17C56B6B,0x1A864DB2,0x1E475005,
    0x2608EDB8,0x22C9F00F,0x2F8AD6D6,0x2B4BCB61,0x350C9B64,0x31CD86D3,0x3C8EA00A,0x384FBDBD,
    0x4C11DB70,0x48D0C6C7,0x4593E01E,0x4152FDA9,0x5F15ADAC,0x5BD4B01B,0x569796C2,0x52568B75,
    0x6A1936C8,0x6ED82B7F,0x639B0DA6,0x675A1011,0x791D4014,0x7DDC5DA3,0x709F7B7A,0x745E66CD,
    0x9823B6E0,0x9CE2AB57,0x91A18D8E,0x95609039,0x8B27C03C,0x8FE6DD8B,0x82A5FB52,0x8664E6E5,
    0xBE2B5B58,0xBAEA46EF,0xB7A96036,0xB3687D81,0xAD2F2D84,0xA9EE3033,0xA4AD16EA,0xA06C0B5D,
    0xD4326D90,0xD0F37027,0xDDB056FE,0xD9714B49,0xC7361B4C,0xC3F706FB,0xCEB42022,0xCA753D95,
    0xF23A8028,0xF6FB9D9F,0xFBB8BB46,0xFF79A6F1,0xE13EF6F4,0xE5FFEB43,0xE8BCCD9A,0xEC7DD02D,
    0x34867077,0x30476DC0,0x3D044B19,0x39C556AE,0x278206AB,0x23431B1C,0x2E003DC5,0x2AC12072,
    0x128E9DCF,0x164F8078,0x1B0CA6A1,0x1FCDBB16,0x018AEB13,0x054BF6A4,0x0808D07D,0x0CC9CDCA,
    0x7897AB07,0x7C56B6B0,0x71159069,0x75D48DDE,0x6B93DDDB,0x6F52C06C,0x6211E6B5,0x66D0FB02,
    0x5E9F46BF,0x5A5E5B08,0x571D7DD1,0x53DC6066,0x4D9B3063,0x495A2DD4,0x44190B0D,0x40D816BA,
    0xACA5C697,0xA864DB20,0xA527FDF9,0xA1E6E04E,0xBFA1B04B,0xBB60ADFC,0xB6238B25,0xB2E29692,
    0x8AAD2B2F,0x8E6C3698,0x832F1041,0x87EE0DF6,0x99A95DF3,0x9D684044,0x902B669D,0x94EA7B2A,
    0xE0B41DE7,0xE4750050,0xE9362689,0xEDF73B3E,0xF3B06B3B,0xF771768C,0xFA325055,0xFEF34DE2,
    0xC6BCF05F,0xC27DEDE8,0xCF3ECB31,0xCBFFD686,0xD5B88683,0xD1799B34,0xDC3ABDED,0xD8FBA05A,
    0x690CE0EE,0x6DCDFD59,0x608EDB80,0x644FC637,0x7A089632,0x7EC98B85,0x738AAD5C,0x774BB0EB,
    0x4F040D56,0x4BC510E1,0x46863638,0x42472B8F,0x5C007B8A,0x58C1663D,0x558240E4,0x51435D53,
    0x251D3B9E,0x21DC2629,0x2C9F00F0,0x285E1D47,0x36194D42,0x32D850F5,0x3F9B762C,0x3B5A6B9B,
    0x0315D626,0x07D4CB91,0x0A97ED48,0x0E56F0FF,0x1011A0FA,0x14D0BD4D,0x19939B94,0x1D528623,
    0xF12F560E,0xF5EE4BB9,0xF8AD6D60,0xFC6C70D7,0xE22B20D2,0xE6EA3D65,0xEBA91BBC,0xEF68060B,
    0xD727BBB6,0xD3E6A601,0xDEA580D8,0xDA649D6F,0xC423CD6A,0xC0E2D0DD,0xCDA1F604,0xC960EBB3,
    0xBD3E8D7E,0xB9FF90C9,0xB4BCB610,0xB07DABA7,0xAE3AFBA2,0xAAFBE615,0xA7B8C0CC,0xA379DD7B,
    0x9B3660C6,0x9FF77D71,0x92B45BA8,0x9675461F,0x8832161A,0x8CF30BAD,0x81B02D74,0x857130C3,
    0x5D8A9099,0x594B8D2E,0x5408ABF7,0x50C9B640,0x4E8EE645,0x4A4FFBF2,0x470CDD2B,0x43CDC09C,
    0x7B827D21,0x7F436096,0x7200464F,0x76C15BF8,0x68860BFD,0x6C47164A,0x61043093,0x65C52D24,
    0x119B4BE9,0x155A565E,0x18197087,0x1CD86D30,0x029F3D35,0x065E2082,0x0B1D065B,0x0FDC1BEC,
    0x3793A651,0x3352BBE6,0x3E119D3F,0x3AD08088,0x2497D08D,0x2056CD3A,0x2D15EBE3,0x29D4F654,
    0xC5A92679,0xC1683BCE,0xCC2B1D17,0xC8EA00A0,0xD6AD50A5,0xD26C4D12,0xDF2F6BCB,0xDBEE767C,
    0xE3A1CBC1,0xE760D676,0xEA23F0AF,0xEEE2ED18,0xF0A5BD1D,0xF464A0AA,0xF9278673,0xFDE69BC4,
    0x89B8FD09,0x8D79E0BE,0x803AC667,0x84FBDBD0,0x9ABC8BD5,0x9E7D9662,0x933EB0BB,0x97FFAD0C,
    0xAFB010B1,0xAB710D06,0xA6322BDF,0xA2F33668,0xBCB4666D,0xB8757BDA,0xB5365D03,0xB1F740B4
};

//将单字节合成四字节
#define Byte_To_DWord(a,b,c,d)  (((uint32_t)(a)<<24) + ((uint32_t)(b)<<16) + ((uint32_t)(c)<<8) + ((uint32_t)(d)<<0))

//------------------------------------------------------------------------------------库_CRC32校验
/*
 输入:
 *in_buf   : 输入的缓冲区（需要校验的缓冲区）
 in_len   : 输入的长度  （需要校验的长度）
 输出:
 uint32_t : 返回生成的CRC32值
 */
uint32_t L_Checkout_Crc32(uint8_t *in_buf, uint16_t in_len)
{
    uint32_t    Temp_Crc32 = 0,     //CRC32校验结果
    Temp_Value = 0;     //临时值

    uint16_t    i, j;               //for循环使用

    //CRC32初始值
    Temp_Crc32 = 0xFFFFFFFF;

    for (j=0; j<(in_len / 4); j++)
    {
        //将缓冲区转成32bit数值
        Temp_Value = Byte_To_DWord(in_buf[3], in_buf[2], in_buf[1], in_buf[0]);
        //与前一个CRC32值异或
        Temp_Crc32 ^= Temp_Value;

        for (i = 0; i < 4; i++)
        {
            Temp_Value = Crc32Table[(uint8_t)((Temp_Crc32 >> 24) & 0xff)];  //取一个字节，查表
            Temp_Crc32 <<= 8;                                               //丢掉计算过的头一个字节
            Temp_Crc32 ^= Temp_Value;                                       //与前一个字节的计算结果异或
        }

        //缓冲区向后移4个字节
        in_buf += 4;
    }

    //输入长度非4的倍数
    if (in_len % 4 > 0)
    {
        //将缓冲区转成32bit数值
        //余1
        if ((in_len % 4) == 1)
        {
            Temp_Value = Byte_To_DWord(0, 0, 0, in_buf[0]);
        }
        //余2
        else if ((in_len % 4) == 2)
        {
            Temp_Value = Byte_To_DWord(0, 0, in_buf[1], in_buf[0]);
        }
        //余3
        else
        {
            Temp_Value = Byte_To_DWord(0, in_buf[2], in_buf[1], in_buf[0]);
        }

        //与前一个CRC32值异或
        Temp_Crc32 ^= Temp_Value;

        for (i=0; i<4; i++)
        {
            Temp_Value = Crc32Table[(uint8_t)((Temp_Crc32 >> 24) & 0xff)];  //取一个字节，查表
            Temp_Crc32 <<= 8;                                               //丢掉计算过的头一个字节
            Temp_Crc32 ^= Temp_Value;                                       //与前一个字节的计算结果异或
        }
    }

    return(Temp_Crc32);
}



// 转为本地大小端模式 返回Unsigned类型的数据
+ (unsigned int)unsignedDataTointWithData:(NSData *)data Location:(NSInteger)location Offset:(NSInteger)offset {
    unsigned int value=0;
    NSData *intdata= [data subdataWithRange:NSMakeRange(location, offset)];
    
    if (offset==2) {
        value=CFSwapInt16BigToHost(*(int*)([intdata bytes]));
    }
    else if (offset==4) {
        value = CFSwapInt32BigToHost(*(int*)([intdata bytes]));
    }
    else if (offset==1) {
        unsigned char *bs = (unsigned char *)[[data subdataWithRange:NSMakeRange(location, 1) ] bytes];
        value = *bs;
    }
    return value;
}

- (void)clickButton {
    NSLog(@"%s", __FUNCTION__);
}

//监控文本变化
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.button.hidden = searchText.length > 0;
}

- (void)test2 {
    //    [self.searchBar hzc_setCancelButtonTitle:@"123"];
    //    UIButton *cancel  = [self.searchBar hzc_getCancelButton];
    //    [cancel setTitle:@"test" forState:(UIControlStateNormal)];
    //    [cancel setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    
    //    [self.searchBar hzc_setCancelButtonTitle:@"哈哈"];
    //    [self.searchBar hzc_setCancelButtonFont:[UIFont systemFontOfSize:30]];
    //
    //    [self.searchBar hzc_setTextColor:[UIColor blueColor]];
    //    [self.searchBar hzc_setTextFont:[UIFont systemFontOfSize:20]];
    UITextField *textField = [self.searchBar hzc_getTextField];
    if (textField) {
        [textField setBackgroundColor:[UIColor whiteColor]];
        textField.layer.cornerRadius = 14.0f;
        textField.layer.borderColor = [UIColor colorWithRed:247/255.0 green:75/255.0 blue:31/255.0 alpha:1].CGColor;
        textField.layer.borderWidth = 1;
        textField.layer.masksToBounds = YES;
    }
    
    [self.searchBar hzc_setBackgroundColor:[UIColor brownColor]];
    
    [self.searchBar hzc_setIconImageName:@"search"];
    
    [self.searchBar hzc_setTextFieldTintColor:[UIColor yellowColor]];
    
    UIButton *button = [self.searchBar hzc_addRightButton:@"search"];
    [button addTarget:self action:@selector(clickButton) forControlEvents:(UIControlEventTouchUpInside)];
    self.button = button;
    self.searchBar.delegate = self;
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

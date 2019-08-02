//
//  NSString+HZCKit.m
//  cookBook
//
//  Created by Apple on 2018/6/21.
//  Copyright © 2018年 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "NSString+HZCKit.h"

@implementation NSString (HZCKit)
/**
 根据字体预估宽高获取字符串实际宽高度
 
 @param font 字体大小
 @param width 预估宽度
 @param height 预估高度
 @return 返回计算后实际尺寸宽、高度
 */
- (CGSize)hzc_getWidthFromTextFontSize:(CGFloat)font AboutWidth:(CGFloat)width AndHeight:(CGFloat)height{
    
    if (!self || self.length == 0) {
        return CGSizeZero;
        
    }
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
    
    
}


- (NSInteger)hzc_chineseCountOfString {
    
    int ChineseCount = 0;
    
    if (self.length == 0) {
        return 0;
    }
    for (int i = 0; i<self.length; i++) {
        unichar c = [self characterAtIndex:i];
        if (c >=0x4E00 && c <=0x9FA5)        {
            ChineseCount++ ;//汉字
        }
    }
    return ChineseCount;
}

- (BOOL)hzc_isChineseCharacter {
    
    if (self.length == 0) {
        return NO;
    }
    unichar c = [self characterAtIndex:0];
    
    if (c >=0x4E00 && c <=0x9FA5)     {
        return YES;//汉字
    } else {
        return NO;//非汉字
    }
}



- (NSString *)hzc_translatArabicNumberals {
    
    if (![self hzc_isChineseCharacter]) {
        NSLog(@"非汉字");
        return self;
    }
    
    NSMutableDictionary * mdic =[[NSMutableDictionary alloc]init];
    
    [mdic setObject:[NSNumber numberWithInt:10000] forKey:@"万"];
    [mdic setObject:[NSNumber numberWithInt:1000] forKey:@"千"];
    [mdic setObject:[NSNumber numberWithInt:100] forKey:@"百"];
    [mdic setObject:[NSNumber numberWithInt:10] forKey:@"十"];
    [mdic setObject:[NSNumber numberWithInt:9] forKey:@"九"];
    [mdic setObject:[NSNumber numberWithInt:8] forKey:@"八"];
    [mdic setObject:[NSNumber numberWithInt:7] forKey:@"七"];
    [mdic setObject:[NSNumber numberWithInt:6] forKey:@"六"];
    [mdic setObject:[NSNumber numberWithInt:5] forKey:@"五"];
    [mdic setObject:[NSNumber numberWithInt:4] forKey:@"四"];
    [mdic setObject:[NSNumber numberWithInt:3] forKey:@"三"];
    [mdic setObject:[NSNumber numberWithInt:2] forKey:@"二"];
    [mdic setObject:[NSNumber numberWithInt:2] forKey:@"两"];
    [mdic setObject:[NSNumber numberWithInt:1] forKey:@"一"];
    [mdic setObject:[NSNumber numberWithInt:0] forKey:@"零"];

    BOOL flag=YES;//yes表示正数，no表示负数
    
    NSString * s=[self substringWithRange:NSMakeRange(0, 1)];
    
    if([s isEqualToString:@"负"]){
        flag=NO;
    }
    
    int i=0;
    if(!flag){
        i=1;
    }
    
    int sum=0;//和
    
    int num[20];//保存单个汉字信息数组
    
    for(int i=0;i<20;i++){//将其全部赋值为0
        
        num[i]=0;
        
    }
    
    int k=0;//用来记录数据的个数
    
    //如果是负数，正常的数据从第二个汉字开始，否则从第一个开始
    
    for(int i = flag ? 0 : 1;i<[self length];i++){
        
        NSString * key=[self substringWithRange:NSMakeRange(i, 1)];
        
        int tmp=[[mdic valueForKey:key] intValue];
        
        num[k++]=tmp;
        
    }
    
    //将获得的所有数据进行拼装
    
    for(int i=0;i<k;i++){
        
        if(num[i]<10&&num[i+1]>=10){
            
            sum+=num[i]*num[i+1];
            
            i++;
            
        }else{
            
            sum+=num[i];
            
        }
        
    }
    
    NSMutableString * result=[[NSMutableString alloc]init];;
    
    if(flag){//如果正数
        
        NSLog(@"%d",sum);
        
        result=[NSMutableString stringWithFormat:@"%d",sum];
        
    }else{//如果负数
        
        NSLog(@"-%d",sum);
        
        result=[NSMutableString stringWithFormat:@"-%d",sum];
        
    }
    
    if ([result isEqualToString:@"0"] && ![self isEqualToString:@"零"]) {
        NSLog(@"非汉字数字");
        return self;
    }
    
    return result;
    
}

- (NSString *)hzc_translatChinestNumberals {
      
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    BOOL flag=YES;//yes表示正数，no表示负数
    if ([self containsString:@"-"]) {
        flag = NO;
    }
    
    for (int i = flag ? 0 : 1; i < self.length; i ++) {
        NSString *substr = [self substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[self.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]]) {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]]) {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]]) {
                    [sums removeLastObject];
                }
            } else {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum]) {
                continue;
            }
        }
        
        [sums addObject:sum];
    }

    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    
    if (!flag) {
        chinese = [NSString stringWithFormat:@"负%@", chinese];
    }
    
    NSLog(@"%@",self);
    NSLog(@"%@",chinese);
    return chinese;
}

///获取当前时间
+ (NSString *)hzc_currentDate {
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
    NSString *dateString = [dateFormatter stringFromDate:currentDate];//将时间转化成字符串
    return dateString;
}

/** 获取当前时间戳 */
+ (NSString *)hzc_currentTime {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

/** 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒 */
- (NSString *)hzc_getDateString {
    NSTimeInterval time=[self doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}

- (NSString *)hzc_getTimeString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:self];//将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]*1000];//字符串转成时间戳,精确到毫秒*1000
    return timeStr;
}

//普通字符串转换为十六进制的。
- (NSString *)hzc_changeHexString {

    NSData *myD = [self dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

+ (NSString *)hzc_hexStringFromString:(NSString *)string {
    return [string hzc_changeHexString];
}

- (NSString *)hzc_hexStringChangeString {
    
    char *myBuffer = (char *)malloc((int)[self length] / 2 + 1);
    bzero(myBuffer, [self length] / 2 + 1);
    for (int i = 0; i < [self length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [self substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
//    NSLog(@"------字符串=======%@",unicodeString);
    return unicodeString;
}

+ (NSString *)hzc_stringFromHexString:(NSString *)hexString {
    return [hexString hzc_hexStringChangeString];
}

+ (NSString *)hzc_hexStringFormData:(NSData *)data {
    return [[[[NSString stringWithFormat:@"%@",data]
              stringByReplacingOccurrencesOfString:@"<" withString:@""]
             stringByReplacingOccurrencesOfString:@">" withString:@""]
            stringByReplacingOccurrencesOfString:@" " withString:@""];
}

// 16进制转NSData
- (NSData *)hzc_convertHexStrToData {
    if (!self || [self length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:20];
    NSRange range;
    if ([self length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [self length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [self substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}



@end

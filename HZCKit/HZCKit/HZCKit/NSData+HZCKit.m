//
//  NSData+HZCKit.m
//  HZCKit
//
//  Created by Ken_cheng on 2019/8/9.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "NSData+HZCKit.h"

@implementation NSData (HZCKit)

//uint8转NSData
+ (NSData *)hzc_byteFromUInt8:(uint8_t)val {
    NSMutableData *valData = [[NSMutableData alloc] init];

    unsigned char valChar[1];
    valChar[0] = 0xff & val;
    [valData appendBytes:valChar length:1];

    return [self hzc_dataWithReverse:valData];
}

//NSData转uint8_t
+ (uint8_t)hzc_uint8FromBytes:(NSData *)fData {
    NSAssert(fData.length == 1, @"uint8FromBytes: (data length != 1)");
    NSData *data = fData;
    uint8_t val = 0;
    [data getBytes:&val length:1];
    return val;
}

//uint16 转NSData
+ (NSData *)hzc_bytesFromUInt16:(uint16_t)val {
    NSMutableData *valData = [[NSMutableData alloc] init];

    unsigned char valChar[2];
    valChar[0] = 0xff & val;
    valChar[1] = (0xff00 & val) >> 8;
    [valData appendBytes:valChar length:2];

    return [self hzc_dataWithReverse:valData];
}

//NSData转uint16
+ (uint16_t)hzc_uint16FromBytes:(NSData *)fData {
    NSAssert(fData.length == 2, @"uint16FromBytes: (data length != 2)");
    NSData *data = [self hzc_dataWithReverse:fData];;
    uint16_t val0 = 0;
    uint16_t val1 = 0;
    [data getBytes:&val0 range:NSMakeRange(0, 1)];
    [data getBytes:&val1 range:NSMakeRange(1, 1)];

    uint16_t dstVal = (val0 & 0xff) + ((val1 << 8) & 0xff00);
    return dstVal;
}

//uint32 转NSData（占八位）
+ (NSData *)hzc_bytesFromUInt32:(uint32_t)val {
    NSMutableData *valData = [[NSMutableData alloc] init];

    unsigned char valChar[4];
    valChar[0] = 0xff & val;
    valChar[1] = (0xff00 & val) >> 8;
    valChar[2] = (0xff0000 & val) >> 16;
    valChar[3] = (0xff000000 & val) >> 24;
    [valData appendBytes:valChar length:4];

    return [self hzc_dataWithReverse:valData];
}

//NSData转Uint32
+ (uint32_t)hzc_uint32FromBytes:(NSData *)fData {
    NSAssert(fData.length == 4, @"uint32FromBytes: (data length != 4)");
    NSData *data = [self hzc_dataWithReverse:fData];

    uint32_t val0 = 0;
    uint32_t val1 = 0;
    uint32_t val2 = 0;
    uint32_t val3 = 0;
    [data getBytes:&val0 range:NSMakeRange(0, 1)];
    [data getBytes:&val1 range:NSMakeRange(1, 1)];
    [data getBytes:&val2 range:NSMakeRange(2, 1)];
    [data getBytes:&val3 range:NSMakeRange(3, 1)];

    uint32_t dstVal = (val0 & 0xff) + ((val1 << 8) & 0xff00) + ((val2 << 16) & 0xff0000) + ((val3 << 24) & 0xff000000);
    return dstVal;
}

//NSData转成NSinteger
+ (NSInteger)hzc_intFormData:(NSData *)data {
    const uint8_t *reportData = [data bytes];
    uint16_t bpm = 0;

    if ((reportData[0] & 0x01) == 0){
        /* uint8 bpm */
        bpm = reportData[1];
    }
    else{
        /* uint16 bpm */
        bpm = CFSwapInt16LittleToHost(*(uint16_t *)(&reportData[1]));
    }
    return bpm;
}
//NSData转成NSinteger
- (NSInteger)hzc_toInt {
    return [NSData hzc_intFormData:self];
}

/**
 反转字节序列
 */
+ (NSData *)hzc_dataWithReverse:(NSData *)srcData {
    NSUInteger byteCount = srcData.length;
    NSMutableData *dstData = [[NSMutableData alloc] initWithData:srcData];
    NSUInteger halfLength = byteCount / 2;
    for (NSUInteger i=0; i<halfLength; i++) {
        NSRange begin = NSMakeRange(i, 1);
        NSRange end = NSMakeRange(byteCount - i - 1, 1);
        NSData *beginData = [srcData subdataWithRange:begin];
        NSData *endData = [srcData subdataWithRange:end];
        [dstData replaceBytesInRange:begin withBytes:endData.bytes];
        [dstData replaceBytesInRange:end withBytes:beginData.bytes];
    }

    return dstData;
}


//data 转byte
//uint8_t byteArray[[data length]];
//[data getBytes:&byteArray length:[data length]];
//
//for (int i = 0; i < [data length] ; i++ ) {
//    Byte byte = byteArray[i];
//    NSLog(@"--byte%x",byte);
//}


//NSData转int (用CFSwapInt32BigToHost)
//NSData *data4 = [completeData subdataWithRange:NSMakeRange(0, 4)];
//int value = CFSwapInt32BigToHost(*(int*)([data4 bytes]));
@end

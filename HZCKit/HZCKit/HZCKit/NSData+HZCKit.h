//
//  NSData+HZCKit.h
//  HZCKit
//
//  Created by Ken_cheng on 2019/8/9.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//大小端转换
#define hzc_Tranverse16(X)  ((((UInt16)(X) & 0xff00) >> 8) |(((UInt16)(X) & 0x00ff) << 8))

#define hzc_Tranverse32(X)  ((((UInt32)(X) & 0xff000000) >> 24) | (((UInt32)(X) & 0x00ff0000) >> 8) | (((UInt32)(X) & 0x0000ff00) << 8) | (((UInt32)(X) & 0x000000ff) << 24))

#define hzc_Tranverse64(X)  ((((UInt64)(X) & 0xff00000000000000) >> 56) | (((UInt64)(X) & 0x00ff000000000000) >> 40) | (((UInt64)(X) & 0x0000ff0000000000) >> 24) | (((UInt64)(X) & 0x000000ff00000000) >> 8) | (((UInt64)(X) & 0x00000000ff000000) << 8) | (((UInt64)(X) & 0x0000000000ff0000) << 24) | (((UInt64)(X) & 0x000000000000ff00) << 40) | (((UInt64)(X) & 0x00000000000000ff) << 56))

@interface NSData (HZCKit)

/** uint8 转NSData*/
+ (NSData *)hzc_byteFromUInt8:(uint8_t)val;
/** NSData 转 uint8 */
+ (uint8_t)hzc_uint8FromBytes:(NSData *)fData;

/** uint16 转NSData */
+ (NSData *)hzc_bytesFromUInt16:(uint16_t)val;
/** NSData 转uint16 */
+ (uint16_t)hzc_uint16FromBytes:(NSData *)fData;
/** uint32 转NSData（占八位）*/
+ (NSData *)hzc_bytesFromUInt32:(uint32_t)val;
/** NSData 转uint32 */
+ (uint32_t)hzc_uint32FromBytes:(NSData *)fData;
/** NSData转成NSinteger */
+ (NSInteger)hzc_intFormData:(NSData *)data;
/** NSData转成NSinteger */
- (NSInteger)hzc_toInt;
/**
 反转字节序列
 */
+ (NSData *)hzc_dataWithReverse:(NSData *)srcData;

@end

NS_ASSUME_NONNULL_END

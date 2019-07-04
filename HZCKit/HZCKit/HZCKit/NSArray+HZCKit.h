//
//  NSArray+HZCKit.h
//  HZCKit
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (HZCKit)
/*
 筛选数组中的对象的相同个数，分组存储，是自定义的对象
 isString：是否字符串数组，不是的话就自定义对象数组，需要指定对象的筛选的key，即对象的属性名
 */
+ (NSArray *)hzc_filterMaxItemsArray:(NSArray *)array isStringObj:(BOOL)isString filterKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

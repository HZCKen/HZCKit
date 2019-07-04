//
//  NSArray+HZCKit.m
//  HZCKit
//
//  Created by Apple on 2019/7/4.
//  Copyright © 2019 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "NSArray+HZCKit.h"

@implementation NSArray (HZCKit)
/*
 筛选数组中的对象的相同个数，分组存储，是自定义的对象
 isString：是否字符串数组，不是的话就自定义对象数组，需要指定对象的筛选的key，即对象的属性名
 */
+ (NSArray *)hzc_filterMaxItemsArray:(NSArray *)array isStringObj:(BOOL)isString filterKey:(NSString *)key {
    NSMutableArray *origArray = [NSMutableArray arrayWithArray:array];
    NSMutableArray *filerArray = [NSMutableArray array];
    
    while (origArray.count > 0) {
        id obj = origArray.firstObject;
        NSPredicate *predic = nil;
        if (isString) {
            predic = [NSPredicate predicateWithFormat:@"self == %@",obj];
        }else {
            id value = [obj valueForKey:key];
            predic = [NSPredicate predicateWithFormat:@"self.%@ == %@",key,value];
        }
        
        NSArray *pArray = [origArray filteredArrayUsingPredicate:predic];
        [filerArray addObject:pArray];
        [origArray removeObjectsInArray:pArray];
    }
    
    return filerArray;
}

@end

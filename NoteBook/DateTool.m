//
//  DateTool.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/5.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool

+ (NSString *)getCUrrentTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (NSString *)getCurrentDay{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"DD";
    return [dateFormatter stringFromDate:[NSDate date]];
}
+ (NSString *)getCurrentWeek{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE";
    return [dateFormatter stringFromDate:[NSDate date]];
}
+ (NSString *)getCurrentMonth{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM";
    return [dateFormatter stringFromDate:[NSDate date]];
}
+ (NSString *)getCurrentWeekCH{
    NSDictionary *dic = @{@"01":@"一月",@"02":@"二月",@"03":@"三月",@"04":@"四月",@"05":@"五月",@"06":@"六月",@"07":@"七月",@"08":@"八月",@"09":@"九月",@"10":@"十月",@"11":@"十一月",@"12":@"十二月"};
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM";
    return dic[[dateFormatter stringFromDate:[NSDate date]]];
}

@end

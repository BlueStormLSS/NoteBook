//
//  Daily+CoreDataProperties.m
//  
//
//  Created by 我叫哀木涕 on 2017/1/13.
//
//  This file was automatically generated and should not be edited.
//

#import "Daily+CoreDataProperties.h"

@implementation Daily (CoreDataProperties)

+ (NSFetchRequest<Daily *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Daily"];
}

@dynamic content;
@dynamic day;
@dynamic mood;
@dynamic time;
@dynamic title;
@dynamic weather;
@dynamic user;

@end

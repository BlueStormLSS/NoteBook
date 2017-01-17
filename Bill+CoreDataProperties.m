//
//  Bill+CoreDataProperties.m
//  
//
//  Created by 我叫哀木涕 on 2017/1/13.
//
//  This file was automatically generated and should not be edited.
//

#import "Bill+CoreDataProperties.h"

@implementation Bill (CoreDataProperties)

+ (NSFetchRequest<Bill *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Bill"];
}

@dynamic num;
@dynamic style;
@dynamic type;
@dynamic user;

@end

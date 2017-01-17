//
//  User+CoreDataProperties.m
//  
//
//  Created by 我叫哀木涕 on 2017/1/13.
//
//  This file was automatically generated and should not be edited.
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic userName;
@dynamic daily;
@dynamic bill;

@end

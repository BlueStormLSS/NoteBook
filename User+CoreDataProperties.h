//
//  User+CoreDataProperties.h
//  
//
//  Created by 我叫哀木涕 on 2017/1/13.
//
//  This file was automatically generated and should not be edited.
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userName;
@property (nullable, nonatomic, retain) Daily *daily;
@property (nullable, nonatomic, retain) Bill *bill;

@end

NS_ASSUME_NONNULL_END

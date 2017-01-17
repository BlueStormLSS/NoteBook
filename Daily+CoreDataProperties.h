//
//  Daily+CoreDataProperties.h
//  
//
//  Created by 我叫哀木涕 on 2017/1/13.
//
//  This file was automatically generated and should not be edited.
//

#import "Daily+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Daily (CoreDataProperties)

+ (NSFetchRequest<Daily *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, copy) NSString *day;
@property (nullable, nonatomic, copy) NSString *mood;
@property (nullable, nonatomic, copy) NSString *time;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *weather;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END

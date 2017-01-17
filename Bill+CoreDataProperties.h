//
//  Bill+CoreDataProperties.h
//  
//
//  Created by 我叫哀木涕 on 2017/1/13.
//
//  This file was automatically generated and should not be edited.
//

#import "Bill+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Bill (CoreDataProperties)

+ (NSFetchRequest<Bill *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *num;
@property (nullable, nonatomic, copy) NSString *style;
@property (nonatomic) BOOL type;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END

//
//  ReadSQL.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/13.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "ReadSQL.h"

@implementation ReadSQL

+ (id)instance{
    static ReadSQL *s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[ReadSQL alloc] init];
    });
    return s_instance;
}

- (NSArray *)readBillList{
    if ([[SaveManager instance] readUserName]) {
        return [User MR_findByAttribute:@"userName" withValue:[[SaveManager instance] readUserName]];
    }else{
        return [User MR_findAll];
    }
}
- (void)saveBill:(BOOL)type style:(NSString *)style number:(NSString *)number{
    User *user = [User MR_createEntity];
    user.userName = [[SaveManager instance] readUserName];

    user.bill = [Bill MR_createEntity];
    user.bill.type = type;
    user.bill.style = style;
    user.bill.num = number;
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        NSLog(@"存储完成");
    }];
}
@end

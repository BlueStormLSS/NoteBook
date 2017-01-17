//
//  ReadSQL.h
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/13.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadSQL : NSObject

+ (id)instance;

- (NSArray *)readBillList;

- (void)saveBill:(BOOL)type style:(NSString *)style number:(NSString *)number;

@end

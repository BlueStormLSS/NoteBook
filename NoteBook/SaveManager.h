//
//  SaveManager.h
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/13.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveManager : NSObject

+ (id)instance;

- (BOOL)saveUserName:(NSString *)userName password:(NSString *)passsword;


- (NSString *)readUserName;
@end

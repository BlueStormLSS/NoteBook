//
//  SaveManager.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/13.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "SaveManager.h"
#import "SFHFKeychainUtils.h"

#define SERVICE_NAME @"MYNAMEISLISHUANGSHUAI"

#define USER_NAME @"userName"
#define PASSWORD @"password"

@implementation SaveManager

+ (id)instance{
    static SaveManager *s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_instance = [[SaveManager alloc] init];
    });
    return s_instance;
}

- (BOOL)saveUserName:(NSString *)userName password:(NSString *)passsword{
    return [SFHFKeychainUtils storeUsername:USER_NAME andPassword:userName forServiceName:SERVICE_NAME updateExisting:1 error:nil] && [SFHFKeychainUtils storeUsername:PASSWORD andPassword:passsword forServiceName:SERVICE_NAME updateExisting:1 error:nil];
}

- (NSString *)readUserName{
    return [SFHFKeychainUtils getPasswordForUsername:USER_NAME andServiceName:SERVICE_NAME error:nil];
}
- (void)removeAll{
    [SFHFKeychainUtils deleteItemForUsername:USER_NAME andServiceName:SERVICE_NAME error:nil];
    [SFHFKeychainUtils deleteItemForUsername:PASSWORD andServiceName:SERVICE_NAME error:nil];
}
@end

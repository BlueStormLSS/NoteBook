//
//  AppVersionCheck.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/17.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "AppVersionCheck.h"
#import "AppInfomation.h"
@implementation AppVersionCheck

+ (void)versionRequest{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleId = infoDic[@"CFBundleIdentifier"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/lookup?bundleId=%@",bundleId]];//@"com.esteel.carryDist"
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!error) {
                    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                    if ([responseDict[@"resultCount"] integerValue] == 1) {
                        NSArray *resultArr = responseDict[@"results"];
                        NSDictionary *reslutDic = resultArr.firstObject;
                        AppInfomation *appInfo = [[AppInfomation alloc] initWithResult:reslutDic];
                        if ([infoDic[@"CFBundleShortVersionString"] compare:appInfo.version options:NSNumericSearch]==NSOrderedAscending) {
                            UIWindow *window = nil;
                            id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
                            if ([delegate respondsToSelector:@selector(window)]) {
                                window = [delegate performSelector:@selector(window)];
                            } else {
                                window = [[UIApplication sharedApplication] keyWindow];
                            }
                            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"检测到新版本，是否更新" preferredStyle:UIAlertControllerStyleAlert];
                            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appInfo.trackViewUrl]];
                            }];
                            [alert addAction:alertAction];
                            [window.rootViewController presentViewController:alert animated:YES completion:nil];
                        }else{
                            NSLog(@"/////");
                        }
                    }
                }
            });
        }];
        [dataTask resume];
        
    });
    
}

@end

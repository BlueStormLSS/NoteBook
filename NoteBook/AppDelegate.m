//
//  AppDelegate.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/5.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
///播放自定制提示音
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
static SystemSoundID push = 0;



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_B];
    self.window.rootViewController = [[MainViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
    
    [MagicalRecord setupAutoMigratingCoreDataStack];
    
    // Override point for customization after application launch.
    return YES;
}

///收到通知后调用此方法可以播放自定制的提示音
-(void)playSound
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"camera" ofType:@"wav"];
    NSLog(@"path = %@",path);
    if (path) {
        //注册声音到系统
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&push);
        AudioServicesPlaySystemSound(push);
        //        AudioServicesPlaySystemSound(push);//如果无法再下面播放，可以尝试在此播放
    }
    AudioServicesPlaySystemSound(push);   //播放注册的声音，（此句代码，可以在本类中的任意位置调用，不限于本方法中）
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);   //让手机震动
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

///程序停止，关闭
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [MagicalRecord cleanUp];
    
}


@end

//
//  AppInfomation.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/17.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "AppInfomation.h"

@implementation AppInfomation

- (instancetype)initWithResult:(NSDictionary *)result{
    
    self = [super init];
    if (self) {
        self.version = result[@"version"];
        self.releaseNotes = result[@"releaseNotes"];
        self.currentVersionReleaseDate = result[@"currentVersionReleaseDate"];
        self.trackId = result[@"trackId"];
        self.bundleId = result[@"bundleId"];
        self.trackViewUrl = result[@"trackViewUrl"];
        self.appDescription = result[@"appDescription"];
        self.sellerName = result[@"sellerName"];
        self.fileSizeBytes = result[@"fileSizeBytes"];
        self.screenshotUrls = result[@"screenshotUrls"];
    }
    return self;
}

@end

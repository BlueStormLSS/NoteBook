//
//  ViewController.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/5.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///此方法可以自定制制定背景色的选中色块(UITabbarController)
//    CGSize indicatorImageSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/4, self.tabBar.frame.size.height);
//    self.tabBar.selectionIndicatorImage = [self drawTabBarItemBackgroundImageWithSize:indicatorImageSize];

}

- (UIImage *)drawTabBarItemBackgroundImageWithSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 43/255.0, 134/255.0, 136/255.0, 1);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

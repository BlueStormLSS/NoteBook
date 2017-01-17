//
//  WriteViewController.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/5.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "WriteViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <IQKeyboardManager/IQTextView.h>
@interface WriteViewController ()<CLLocationManagerDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *monthLabel;
@property (nonatomic,strong) UILabel *dayLabel;
@property (nonatomic,strong) UILabel *weekTimeLabel;
@property (nonatomic,strong) UILabel *placeLabel;

@property (nonatomic,strong) UITextField *titleTextField;
@property (nonatomic,strong) IQTextView *contentTextView;

@property (nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation WriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.backView];
    [self.view addSubview:self.monthLabel];
    [self.view addSubview:self.dayLabel];
    [self.view addSubview:self.weekTimeLabel];
    [self.view addSubview:self.placeLabel];
    [self.view addSubview:self.titleTextField];
    [self.view addSubview:self.contentTextView];
    
    [self layoutSubViews];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 10;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.weekTimeLabel.text = [NSString stringWithFormat:@"%@  %@",[DateTool getCurrentWeek],[DateTool getCUrrentTime]];
}
- (IQTextView *)contentTextView{
    if (!_contentTextView) {
        _contentTextView = [[IQTextView alloc] init];
        _contentTextView.placeholder = @"请输入内容";
        _contentTextView.font = [UIFont systemFontOfSize:15];
    }
    return _contentTextView;
}
- (UITextField *)titleTextField{
    if (!_titleTextField) {
        _titleTextField = [[UITextField alloc] init];
        _titleTextField.placeholder = @"题目";
        _titleTextField.delegate = self;
    }
    return _titleTextField;
}
- (UILabel *)placeLabel{
    if (!_placeLabel) {
        _placeLabel = [[UILabel alloc] init];
        _placeLabel.textColor = [UIColor whiteColor];
        _placeLabel.textAlignment = NSTextAlignmentCenter;
        _placeLabel.text = @"  ";
    }
    return _placeLabel;
}
- (UILabel *)weekTimeLabel{
    if (!_weekTimeLabel) {
        _weekTimeLabel = [[UILabel alloc] init];
        _weekTimeLabel.textColor = [UIColor whiteColor];
        _weekTimeLabel.textAlignment = NSTextAlignmentCenter;
        _weekTimeLabel.text = [NSString stringWithFormat:@"%@  %@",[DateTool getCurrentWeek],[DateTool getCUrrentTime]];
    }
    return _weekTimeLabel;
}
- (UILabel *)dayLabel{
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textColor = [UIColor whiteColor];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.text = [DateTool getCurrentDay];
        _dayLabel.font = [UIFont systemFontOfSize:50];
    }
    return _dayLabel;
}
- (UILabel *)monthLabel{
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.textColor = [UIColor whiteColor];
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        _monthLabel.text = [DateTool getCurrentWeekCH];
    }
    return _monthLabel;
}
- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor grayColor];
    }
    return _backView;
}
- (void)layoutSubViews{
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(_backView.mas_width).multipliedBy(0.6);
    }];
    ///自适应宽度
    [_dayLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_backView.mas_centerY).multipliedBy(0.7);
        make.centerX.mas_equalTo(_backView.mas_centerX);
        make.height.mas_equalTo(70);
    }];
    
    [_monthLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_dayLabel.mas_top);
        make.centerX.mas_equalTo(_backView.mas_centerX);
        make.height.mas_equalTo(40);
    }];
    
    [_weekTimeLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_weekTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_dayLabel.mas_bottom);
        make.centerX.mas_equalTo(_backView.mas_centerX);
        make.height.mas_equalTo(40);
    }];
    [_placeLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_weekTimeLabel.mas_bottom);
        make.centerX.mas_equalTo(_weekTimeLabel.mas_centerX).offset(-30);
        make.height.mas_equalTo(40);
    }];
    [_titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_backView.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleTextField.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
}
#pragma mark - 地图代理 -
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    //    NSLog(@"获取的经纬度：%@--%ld",locations[0],locations.count);
    ///获取当前经纬度的名字
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    ///反地理编码
    [geocoder reverseGeocodeLocation:locations[0] completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count>0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            //            2017-01-05 16:46:26.477 NoteBook[12372:2040136] 地址：堰头宅
            //            2017-01-05 16:46:26.478 NoteBook[12372:2040136] 城市：上海市
            //            2017-01-05 16:46:26.478 NoteBook[12372:2040136] 宝山区--(null)--宝山区
            NSLog(@"地址：%@",placemark.name);
            NSLog(@"城市：%@",placemark.locality);
            NSLog(@"子位置：%@--子大道%@--大道%@",placemark.subLocality,placemark.subThoroughfare,placemark.thoroughfare);
            _placeLabel.text = [NSString stringWithFormat:@"%@%@",placemark.locality,placemark.subLocality];
        }
    }];
    [self.locationManager stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@",error.description);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

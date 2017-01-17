//
//  CalendarViewController.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/5.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "CalendarViewController.h"

@interface CalendarViewController ()

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *monthLabel;
@property (nonatomic,strong) UILabel *dayLabel;
@property (nonatomic,strong) UILabel *weekLabel;

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
//    NSDate *date = [NSDate date];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitDay
//                                         fromDate:date];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    
//    [dateFormatter setDateFormat:@"YYYY-MM-dd-EEEE"];
//    NSLog(@"%@",[dateFormatter stringFromDate:date]);
    
    [self.view addSubview:self.backView];
    [self.view addSubview:self.monthLabel];
    [self.view addSubview:self.dayLabel];
    [self.view addSubview:self.weekLabel];
    
    [self layoutSubViews];
    // Do any additional setup after loading the view.
}

- (UILabel *)weekLabel{
    if (!_weekLabel) {
        _weekLabel = [[UILabel alloc] init];
        _weekLabel.textAlignment = NSTextAlignmentCenter;
        _weekLabel.backgroundColor = [UIColor orangeColor];
        _weekLabel.textColor = [UIColor whiteColor];
        _weekLabel.text = [DateTool getCurrentWeek];
    }
    return _weekLabel;
}
- (UILabel *)dayLabel{
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.backgroundColor = [UIColor blueColor];
        _dayLabel.textColor = [UIColor whiteColor];
        _dayLabel.font = [UIFont systemFontOfSize:40];
        _dayLabel.text = [DateTool getCurrentDay];
    }
    return _dayLabel;
}
- (UILabel *)monthLabel{
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        _monthLabel.backgroundColor = [UIColor orangeColor];
        _monthLabel.textColor = [UIColor whiteColor];
        _monthLabel.text = [DateTool getCurrentWeekCH];
    }
    return _monthLabel;
}
- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}
#pragma mark - layout -
- (void)layoutSubViews{
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(_backView.mas_width).multipliedBy(1);
    }];

    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_backView.mas_centerY);
        make.left.mas_equalTo(_backView.mas_left);
        make.right.mas_equalTo(_backView.mas_right);
        make.height.mas_equalTo(80);
    }];
    [_monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_dayLabel.mas_top);
        make.left.mas_equalTo(_backView.mas_left);
        make.right.mas_equalTo(_backView.mas_right);
        make.height.mas_equalTo(40);
    }];
    [_weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_dayLabel.mas_bottom);
        make.left.mas_equalTo(_backView.mas_left);
        make.right.mas_equalTo(_backView.mas_right);
        make.height.mas_equalTo(40);
    }];
    
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

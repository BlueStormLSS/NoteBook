//
//  ListTBVC.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/6.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "ListTBVC.h"

@interface ListTBVC()

@property (nonatomic,strong) UILabel *dayLabel;
@property (nonatomic,strong) UILabel *monthLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIImageView *weatherImage;
@property (nonatomic,strong) UIImageView *moodImage;
@property (nonatomic,strong) UIImageView *tipImage;
@property (nonatomic,strong) UILabel *smallTitleLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *attachmentImage;

@end

@implementation ListTBVC

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
        [self subviewsLayout];
    }
    return self;
}
- (void)setUpUI{
    [self.contentView addSubview:self.dayLabel];
    [self.contentView addSubview:self.monthLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.weatherImage];
    [self.contentView addSubview:self.moodImage];
    [self.contentView addSubview:self.tipImage];
    [self.contentView addSubview:self.smallTitleLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.attachmentImage];
}
- (void)subviewsLayout{
    [_dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        
    }];
    [_monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_weatherImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_moodImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_tipImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_smallTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_attachmentImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}
- (UIImageView *)attachmentImage{
    if (!_attachmentImage) {
        _attachmentImage = [[UIImageView alloc] init];
        _attachmentImage.backgroundColor = [UIColor greenColor];
    }
    return _attachmentImage;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor orangeColor];
        _contentLabel.text = @"1";
    }
    return _contentLabel;
}
- (UILabel *)smallTitleLabel{
    if (!_smallTitleLabel) {
        _smallTitleLabel = [[UILabel alloc] init];
        _smallTitleLabel.backgroundColor = [UIColor orangeColor];
        _smallTitleLabel.text = @"1";
    }
    return _smallTitleLabel;
}
- (UIImageView *)tipImage{
    if (!_tipImage) {
        _tipImage = [[UIImageView alloc] init];
        _tipImage.backgroundColor = [UIColor greenColor];
    }
    return _tipImage;
}
- (UIImageView *)moodImage{
    if (!_moodImage) {
        _moodImage = [[UIImageView alloc] init];
        _moodImage.backgroundColor = [UIColor greenColor];
    }
    return _moodImage;
}
- (UIImageView *)weatherImage{
    if (!_weatherImage) {
        _weatherImage = [[UIImageView alloc] init];
        _weatherImage.backgroundColor = [UIColor greenColor];
    }
    return _weatherImage;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor orangeColor];
        _timeLabel.text = @"1";
    }
    return _timeLabel;
}
- (UILabel *)monthLabel{
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc] init];
        _monthLabel.backgroundColor = [UIColor orangeColor];
        _monthLabel.text = @"1";
    }
    return _monthLabel;
}
- (UILabel *)dayLabel{
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc] init];
        _dayLabel.backgroundColor = [UIColor orangeColor];
        _dayLabel.text = @"1";
    }
    return _dayLabel;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

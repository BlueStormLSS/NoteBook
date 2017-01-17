//
//  BottomToolView.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/6.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "BottomToolView.h"

@interface BottomToolView()


@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UIButton *writeButton;
@property (nonatomic,strong) UIButton *locationButton;
@property (nonatomic,strong) UIButton  *camaraButton;
@property (nonatomic,strong) UIButton *cancleButton;

@end


@implementation BottomToolView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeEqualWidthViews:@[self.backButton,self.writeButton,self.locationButton,self.camaraButton,self.cancleButton] inView:self LRpadding:0 viewPadding:0];
    }
    return self;
}

- (UIButton *)cancleButton{
    if (!_cancleButton) {
        _cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_cancleButton setTitle:@"CANCLE" forState:UIControlStateNormal];
        _cancleButton.backgroundColor = [UIColor blackColor];
        _cancleButton.tag = 5;
        [_cancleButton addTarget:self action:@selector(buttonBeClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleButton;
}
- (UIButton *)camaraButton{
    if (!_camaraButton) {
        _camaraButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_camaraButton setTitle:@"PHOTO" forState:UIControlStateNormal];
         _camaraButton.backgroundColor = [UIColor blackColor];
        _camaraButton.tag = 4;
        [_camaraButton addTarget:self action:@selector(buttonBeClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _camaraButton;
}
- (UIButton *)locationButton{
    if (!_locationButton) {
        _locationButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_locationButton setTitle:@"LOCATION" forState:UIControlStateNormal];
         _locationButton.backgroundColor = [UIColor blackColor];
        _locationButton.tag = 3;
        [_locationButton addTarget:self action:@selector(buttonBeClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _locationButton;
}
- (UIButton *)writeButton{
    if (!_writeButton) {
        _writeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_writeButton setTitle:@"WRITE" forState:UIControlStateNormal];
         _writeButton.backgroundColor = [UIColor blackColor];
        _writeButton.tag = 2;
        [_writeButton addTarget:self action:@selector(buttonBeClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _writeButton;
}
- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_backButton setTitle:@"BACK" forState:UIControlStateNormal];
         _backButton.backgroundColor = [UIColor blackColor];
        _backButton.tag = 1;
        [_backButton addTarget:self action:@selector(buttonBeClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
- (void)buttonBeClicked:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(toolBeClickButtonTag:)]) {
        [self.delegate toolBeClickButtonTag:button.tag];
    }
}
/**
 *  将若干view等宽布局于容器containerView中
 *
 *  @param views         viewArray
 *  @param containerView 容器view
 *  @param LRpadding     距容器的左右边距
 *  @param viewPadding   各view的左右边距
 */
-(void)makeEqualWidthViews:(NSArray *)views inView:(UIView *)containerView LRpadding:(CGFloat)LRpadding viewPadding :(CGFloat)viewPadding
{
    UIView *lastView;
    for (UIButton *view in views) {
        [containerView addSubview:view];
        if (lastView) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(containerView);
                make.left.equalTo(lastView.mas_right).offset(viewPadding);
                make.width.equalTo(lastView);
            }];
        }else
        {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(containerView).offset(LRpadding);
                make.top.bottom.equalTo(containerView);
            }];
        }
        lastView=view;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(containerView).offset(-LRpadding);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  DiaryViewController.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/5.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "DiaryViewController.h"
#import "ListViewController.h"
#import "CalendarViewController.h"
#import "WriteViewController.h"

#import "BottomToolView.h"
@interface DiaryViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,ToolButtonBeClicked>

@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UISegmentedControl *segmentControl;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIPageViewController *pageVC;
@property (nonatomic,strong) NSArray *vcArr;

@property (nonatomic,strong) BottomToolView *toolView;

@end

@implementation DiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.titleLabel];
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.toolView];
    
    [self layoutSubViews];
    // Do any additional setup after loading the view.
}
#pragma mark - data -
- (NSArray *)vcArr{
    if (!_vcArr) {
        _vcArr = @[[[ListViewController alloc] init],[[CalendarViewController alloc] init],[[WriteViewController alloc] init]];
    }
    return _vcArr;
}
#pragma mark - delegate -
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = [self.vcArr indexOfObject:viewController];
    if (index>0) {
        index--;
        return self.vcArr[index];
    }
    return nil;
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = [self.vcArr indexOfObject:viewController];
    if (index<self.vcArr.count-1) {
        index++;
        return self.vcArr[index];
    }
    return nil;
}
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    _segmentControl.selectedSegmentIndex = [_vcArr indexOfObject:_pageVC.viewControllers[0]];
}
- (void)toolBeClickButtonTag:(NSUInteger)index{
    switch (index) {
        case 1:
            [self dismissViewControllerAnimated:YES completion:^{
            }];
            break;
        case 2:{
            WS(sw);
            [_pageVC setViewControllers:@[self.vcArr[2]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
                sw.segmentControl.selectedSegmentIndex = 2;
            }];
        }
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        default:
            break;
    }
}
#pragma mark - target -
- (void)segmentControlChange:(UISegmentedControl *)seg{
    [_pageVC setViewControllers:@[self.vcArr[seg.selectedSegmentIndex]] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:^(BOOL finished) {
        
    }];
}

#pragma mark - UI -
- (BottomToolView *)toolView{
    if (!_toolView) {
        _toolView = [[BottomToolView alloc] init];
        _toolView.backgroundColor = [UIColor orangeColor];
        _toolView.delegate = self;
    }
    return _toolView;
}
- (UIPageViewController *)pageVC{
    if (!_pageVC) {
        _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        [self.view addSubview:_pageVC.view];
        [_pageVC setViewControllers:@[self.vcArr[0]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
            
        }];
        _pageVC.delegate = self;
        _pageVC.dataSource = self;
    }
    return _pageVC;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"sss";
    }
    return _titleLabel;
}
- (UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"项目",@"日历",@"日记"]];
        _segmentControl.selectedSegmentIndex = 0;
        [_segmentControl addTarget:self action:@selector(segmentControlChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentControl;
}
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor orangeColor];
    }
    return _headerView;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark - layout -
- (void)layoutSubViews{
    [_headerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(80);
    }];
    [_segmentControl mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerView.mas_top).offset(30);
        make.left.mas_equalTo(_headerView.mas_left).offset(30);
        make.right.mas_equalTo(_headerView.mas_right).offset(-30);
        make.bottom.mas_equalTo(_headerView.mas_bottom).offset(-30);
    }];
    [_pageVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerView.mas_bottom).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-50);
    }];
    [_toolView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_pageVC.view.mas_bottom).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
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

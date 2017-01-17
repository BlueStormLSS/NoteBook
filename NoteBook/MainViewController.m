//
//  MainViewController.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/5.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "MainViewController.h"

#import "DiaryViewController.h"

#import "BillViewController.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIImageView *headerView;
@property (nonatomic,strong) UIButton *headerButton;

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.headerButton];
    [self.view addSubview:self.tableView];
    [self layoutSubViews];
    // Do any additional setup after loading the view.
}
#pragma mark - delegate -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld----%ld",indexPath.section,indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self presentViewController:[[DiaryViewController alloc] init] animated:YES completion:^{
                
            }];
            break;
        case 1:{
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[BillViewController alloc] init]] animated:YES completion:^{
                
            }];
        }
        default:
            break;
    }
    
    
    
}
#pragma mark - target -
- (void)headerButtonBeClicked{
    
}
#pragma mark - UI -
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:SCREEN_B style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (UIButton *)headerButton{
    if (!_headerButton) {
        _headerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _headerButton.backgroundColor = [UIColor grayColor];
        [_headerButton addTarget:self action:@selector(headerButtonBeClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headerButton;
}
- (UIImageView *)headerView{
    if (!_headerView) {
        _headerView = [[UIImageView alloc] init];
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
    [_headerButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerView.mas_top).offset(40);
        make.left.mas_equalTo(_headerView.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_headerView.mas_bottom).offset(0);
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

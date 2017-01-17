//
//  BillViewController.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/12.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "BillViewController.h"
#import "BillTableViewCell.h"


#import "BillAddViewController.h"




@interface BillViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation BillViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"BillTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Do any additional setup after loading the view from its nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell refreshTableViewCell:(arc4random()%100%2==0)];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 64;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            [[ReadSQL instance] saveBill:NO style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
            
        }
            break;
        case 1:
        {
            [[ReadSQL instance] saveBill:YES style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 2:
        {
            [[ReadSQL instance] saveBill:NO style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 3:
        {
            [[ReadSQL instance] saveBill:YES style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 4:
        {
            [[ReadSQL instance] saveBill:YES style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 5:
        {
            [[ReadSQL instance] saveBill:NO style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 6:
        {
            [[ReadSQL instance] saveBill:YES style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 7:
        {
            [[ReadSQL instance] saveBill:YES style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 8:
        {
            [[ReadSQL instance] saveBill:NO style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 9:
        {
            [[ReadSQL instance] saveBill:YES style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 10:
        {
            [[ReadSQL instance] saveBill:NO style:[NSString stringWithFormat:@"%ld",indexPath.row] number:@"kkk"];
        }
            break;
        case 11:
        {
            
        }
            break;
        default:
            break;
    }
}
- (IBAction)addButtonBeClicked:(UIButton *)sender {
    

    [[SaveManager instance] saveUserName:@"11111" password:@"11111"];
    
    ////MR_saveToPersistentStoreAndWait

    ///保存到永久存储
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
    
    
//    [self.navigationController pushViewController:[[BillAddViewController alloc] init] animated:YES];
}

- (IBAction)backButtonBeClicked:(UIButton *)sender {
    
    NSLog(@"%@",[[ReadSQL instance] readBillList]);
    

//    [self dismissViewControllerAnimated:YES completion:^{
//        
//    }];
    
}
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

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

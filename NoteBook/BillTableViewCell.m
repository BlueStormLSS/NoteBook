//
//  BillTableViewCell.m
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/13.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import "BillTableViewCell.h"


@interface BillTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *outClass;
@property (weak, nonatomic) IBOutlet UILabel *outNum;

@property (weak, nonatomic) IBOutlet UILabel *inClass;
@property (weak, nonatomic) IBOutlet UILabel *inNum;

@end

@implementation BillTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)refreshTableViewCell:(BOOL)income{
    self.outClass.hidden = income;
    self.outNum.hidden = income;
    self.inClass.hidden = !income;
    self.inNum.hidden = !income;
    
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

//
//  BottomToolView.h
//  NoteBook
//
//  Created by 我叫哀木涕 on 2017/1/6.
//  Copyright © 2017年 我叫哀木涕. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolButtonBeClicked <NSObject>

- (void)toolBeClickButtonTag:(NSUInteger)index;

@end

@interface BottomToolView : UIView

@property (nonatomic,weak) id<ToolButtonBeClicked> delegate;

@end

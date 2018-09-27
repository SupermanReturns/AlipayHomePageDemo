//
//  IndexTableView.h
//  AlipayHomePageDemo
//
//  Created by Superman on 2018/9/27.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexTableView : UITableView

@property(assign,nonatomic)CGFloat contentOffsetY;

-(void)startRefreshing;
-(void)endRefreshing;
@end

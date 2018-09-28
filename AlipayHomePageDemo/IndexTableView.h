//
//  IndexTableView.h
//  AlipayHomePageDemo
//
//  Created by Superman on 2018/9/27.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ChangeContentSize)(CGSize);     //选择文件夹

@interface IndexTableView : UITableView

@property(assign,nonatomic)CGFloat contentOffsetY;

@property (copy,nonatomic)ChangeContentSize changeContentSize;

-(void)startRefreshing;
-(void)endRefreshing;
-(void)loadeMoreData;

//-(void)setScrollViewContentOffSet:(CGPoint)point;
-(void)setScrollViewContentOffSet:(CGPoint)point;
@end

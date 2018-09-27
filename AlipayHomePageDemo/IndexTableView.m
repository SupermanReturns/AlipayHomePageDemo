//
//  IndexTableView.m
//  AlipayHomePageDemo
//
//  Created by Superman on 2018/9/27.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "IndexTableView.h"
#import <MJRefresh/MJRefresh.h>

#define numberRows 50


@interface IndexTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IndexTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
   self= [super initWithFrame:frame style:style];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.rowHeight = (1000 - 140) / 20;
        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:nil];
    }
   
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return numberRows;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld---",indexPath.row];
    return cell;
}
-(void)startRefreshing {
    [self.mj_header beginRefreshing];
}
-(void)endRefreshing {
    [self.mj_header endRefreshing];
}

-(void)setContentOffsetY:(CGFloat)contentOffsetY {
    _contentOffsetY = contentOffsetY;
    if (![self.mj_header isRefreshing]) {
        self.contentOffset = CGPointMake(0, contentOffsetY);
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

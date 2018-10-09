//
//  IndexTableView.m
//  AlipayHomePageDemo
//
//  Created by Superman on 2018/9/27.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "IndexTableView.h"
//#import <MJRefresh/MJRefresh.h>
#import "MJRefresh.h"

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
        
        __weak typeof(self) weakSelf = self;
        self.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
                [weakSelf.mj_header endRefreshing];
                [weakSelf reloadData];
            });
    
        }];
    }
   
    return self;
}
-(void)loadeMoreData{
    numberRows;
    [self reloadData];
    _changeContentSize(self.contentSize);
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
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

}
-(void)setScrollViewContentOffSet:(CGPoint)point{
    if (!self.mj_header.isRefreshing) {
        self.contentOffset = point;
    }
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

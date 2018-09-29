//
//  ViewController.m
//  AlipayHomePageDemo
//
//  Created by Superman on 2018/9/21.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"

//#import <MJRefresh/MJRefresh.h>
#import "IndexTableView.h"
#import "UIButton+Extension.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


#define functionHeaderViewHeight 95
#define singleAppHeaderViewHeight 60

@interface ViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property(strong,nonatomic)UIScrollView *mainScrollView;
@property(strong,nonatomic)UIView *navView;
@property(strong,nonatomic)UIView *mainNavView;
@property(strong,nonatomic)UIView *coverNavView;
@property(strong,nonatomic)IndexTableView *indexTableView;
@property(strong,nonatomic)UIView *functionHeaderView;

@property(strong,nonatomic)UIView *appHeaderView;
@property(strong,nonatomic)UIView *headerView;

@property(assign,nonatomic)NSInteger topOffsetY;


@end

@implementation ViewController
-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        CGFloat height = kHeight -64;
        _mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kWidth, height)];
        _mainScrollView.delegate=self;
        _mainScrollView.contentSize = CGSizeMake(kWidth,100);
        _mainScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(155, 0, 0, 0);
        _mainScrollView.backgroundColor=[UIColor greenColor];
    }
    return _mainScrollView;
}
-(UIView *)navView{
    if (!_navView) {
        _navView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
        _navView.backgroundColor=[UIColor colorWithRed:65/255.0 green:128/255.0 blue:1 alpha:1];
    }
    return _navView;
}
-(UIView *)mainNavView{
    if (!_mainNavView) {
        _mainNavView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,kWidth , 64)];
        _mainNavView.backgroundColor=[UIColor clearColor];
        
        UIButton *payButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [payButton setImage:[UIImage imageNamed:@"home_pay"] forState:UIControlStateNormal];
        [payButton setTitle:@"账单" forState:UIControlStateNormal];
        payButton.titleLabel.font = [UIFont systemFontOfSize:13];
        payButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [payButton.titleLabel sizeToFit];
        
        CGRect newFrame=payButton.frame;
        newFrame.origin.y = 20+10;
        newFrame.origin.x=10;
        newFrame.size.width =newFrame.size.width +10;
        payButton.frame = newFrame;
        [_mainNavView addSubview:payButton];
    }
    return _mainNavView;
}
-(UIView *)coverNavView{
    if (!_coverNavView) {
        _coverNavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64)];
        
        UIButton *payButton=[UIButton buttonWithType:UIButtonTypeCustom];
//        [payButton setImage:@"" forState:UIControlStateNormal];
        [payButton.titleLabel sizeToFit];

        CGRect newFrame=payButton.frame;
        newFrame.origin.y = 20+10;
        newFrame.origin.x=10;
        newFrame.size.width =newFrame.size.width +10;
        payButton.frame = newFrame;
        
        UIButton *scanButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [scanButton setImage:[UIImage imageNamed:@"home_scan"] forState:UIControlStateNormal];
        [scanButton.titleLabel sizeToFit];
        newFrame.origin.x = newFrame.origin.x +40 + newFrame.size.width;
        scanButton.frame= newFrame;
        
        UIButton *searchButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [searchButton setImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
        [searchButton.titleLabel sizeToFit];
        newFrame.origin.x = newFrame.origin.x +40 + newFrame.size.width;
        searchButton.frame  =newFrame;
        
        
        [_coverNavView addSubview:payButton];
        [_coverNavView addSubview:scanButton];
        [_coverNavView addSubview:searchButton];
//        _coverNavView.backgroundColor=[UIColor yellowColor];
        _coverNavView.alpha =0;
    }
    return _coverNavView;
}
-(UITableView *)indexTableView{
    if (!_indexTableView) {
        int orginY = singleAppHeaderViewHeight + functionHeaderViewHeight;
        int tableviewHeight = 1000 - orginY;
        _indexTableView = [[IndexTableView alloc]initWithFrame:CGRectMake(0, orginY, kWidth, tableviewHeight) style:UITableViewStylePlain];
//        _indexTableView.isScrollEnabled = false;
//        _indexTableView.scrollEnabled=false;
    }
    return _indexTableView;
}
-(UIView *)functionHeaderView{
    if (!_functionHeaderView) {
        _functionHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, functionHeaderViewHeight)];
        _functionHeaderView.backgroundColor=[UIColor yellowColor];
        CGFloat padding =5.0;
        CGFloat buttonWidth =kWidth/4 - padding*2;
        
        UIButton *scanButton=[UIButton buttonWithType:UIButtonTypeCustom];
        scanButton.frame=CGRectMake(padding, padding, buttonWidth, buttonWidth);
        
        [scanButton setImage:[UIImage imageNamed:@"home_scan"] forState:UIControlStateNormal];
        [scanButton setTitle:@"扫一扫" forState:UIControlStateNormal];
        scanButton.titleLabel.font = [UIFont systemFontOfSize:14];
       [ scanButton alignImageAndTitleVertically:6.0];
        
        UIButton *payButton=[UIButton buttonWithType:UIButtonTypeCustom];
        payButton.frame=CGRectMake(padding+ kWidth/4.0, padding, buttonWidth, buttonWidth);
        [payButton setImage:[UIImage imageNamed:@"home_pay"] forState:UIControlStateNormal];
        [payButton setTitle:@"付款" forState:UIControlStateNormal];
        payButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [payButton alignImageAndTitleVertically:6.0];

        UIButton *cardButton=[UIButton buttonWithType:UIButtonTypeCustom];
        cardButton.frame=CGRectMake(padding+ kWidth/4.0*2, padding, buttonWidth, buttonWidth);
        [cardButton setImage:[UIImage imageNamed:@"home_pay"] forState:UIControlStateNormal];
        [cardButton setTitle:@"卡券" forState:UIControlStateNormal];
        cardButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [cardButton alignImageAndTitleVertically:6.0];

        UIButton *xiuButton=[UIButton buttonWithType:UIButtonTypeCustom];
        xiuButton.frame=CGRectMake(padding+ kWidth/4.0*3, padding, buttonWidth, buttonWidth);
        [xiuButton setImage:[UIImage imageNamed:@"home_xiu"] forState:UIControlStateNormal];
        [xiuButton setTitle:@"到位" forState:UIControlStateNormal];
        xiuButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [xiuButton alignImageAndTitleVertically:6.0];

        [_functionHeaderView addSubview:scanButton];
        [_functionHeaderView addSubview:payButton];
        [_functionHeaderView addSubview:cardButton];
        [_functionHeaderView addSubview:xiuButton];
    }
    return _functionHeaderView;
}
-(UIView *)appHeaderView{
    if (!_appHeaderView) {
        _appHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, functionHeaderViewHeight, kWidth, singleAppHeaderViewHeight)];
        _appHeaderView.backgroundColor=[UIColor cyanColor];
    }
    return _appHeaderView;
}
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth,functionHeaderViewHeight + singleAppHeaderViewHeight)];
//        _headerView.backgroundColor=[UIColor colorWithRed:65/255.0 green:128/255.0 blue:1 alpha:1];
        _headerView.backgroundColor=[UIColor redColor];
    }
    return _headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _topOffsetY =functionHeaderViewHeight + singleAppHeaderViewHeight;
    
    [self.view addSubview:self.mainScrollView];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.mainNavView];
    [self.view addSubview:self.coverNavView];

    [self.mainScrollView addSubview:self.headerView];
    [_headerView addSubview:self.functionHeaderView];
    [_headerView addSubview:self.appHeaderView];
    [_mainScrollView addSubview:self.indexTableView];
    
//    _indexTableView.changeContentSize=^(){
//
//    };
    __weak typeof(self) weakSelf = self;
    _indexTableView.changeContentSize = ^(CGSize contentSize) {
        [weakSelf updateContentSize:contentSize];
    };
    _mainScrollView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
            [weakSelf.mainScrollView.mj_footer endRefreshing];
            [weakSelf.indexTableView loadeMoreData];
        });

    }];
    

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateContentSize:_indexTableView.contentSize];
}
-(void)updateContentSize:(CGSize)size{
    CGSize contentSize = size;
    contentSize.height = contentSize.height + _topOffsetY;
    _mainScrollView.contentSize =contentSize;
    CGRect newframe = _indexTableView.frame;
    newframe.size.height = size.height;
    _indexTableView.frame=newframe;
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat y = scrollView.contentOffset.y;
    
    if (y<-65) {
        [_indexTableView.mj_header beginRefreshing];
    }else if (y>0 && y<= functionHeaderViewHeight){
        [self functionViewAnimation:y];
    }
}
-(void)functionViewAnimation:(CGFloat) offsetY{
    if (offsetY>functionHeaderViewHeight/2.0) {
        [_indexTableView setContentOffset:CGPointMake(0, 95) animated:true];
    }else{
        [_indexTableView setContentOffset:CGPointMake(0, 0) animated:true];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y = scrollView.contentOffset.y;
    if (y<=0) {
        CGRect newFrame = self.headerView.frame;
        newFrame.origin.y = y;
        self.headerView.frame = newFrame;

        newFrame = self.indexTableView.frame;
        newFrame.origin.y = y + _topOffsetY;
        self.indexTableView.frame = newFrame;
        
        [_indexTableView setScrollViewContentOffSet:CGPointMake(0, y)];
        //功能区状态回归
        newFrame = self.functionHeaderView.frame;
        newFrame.origin.y = 0;
        self.functionHeaderView.frame = newFrame;

    }else if (y < functionHeaderViewHeight && y>0){
        CGRect newFrame = self.functionHeaderView.frame;
        newFrame.origin.y = y/2;
        self.functionHeaderView.frame = newFrame;
        
        CGFloat alpha=(1 - y/functionHeaderViewHeight*2.5 ) > 0 ? (1 - y/functionHeaderViewHeight*2.5 ) : 0;
        _functionHeaderView.alpha=alpha;
        if(alpha>0.5){
            CGFloat newAlpha =  alpha*2 - 1;
            _mainNavView.alpha=newAlpha;
            _coverNavView.alpha = 0;
        }else{
            CGFloat newAlpha =  alpha*2;
            _mainNavView.alpha = 0;
            _coverNavView.alpha = 1 - newAlpha;
        }


    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
























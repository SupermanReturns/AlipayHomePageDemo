//
//  ViewController.m
//  AlipayHomePageDemo
//
//  Created by Superman on 2018/9/21.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"
//#import "MJRefresh.h"
#import <MJRefresh/MJRefresh.h>

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height


#define functionHeaderViewHeight 95
#define singleAppHeaderViewHeight 60

@interface ViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property(strong,nonatomic)UIScrollView *mainScrollView;
@property(strong,nonatomic)UIView *navView;
@property(strong,nonatomic)UIView *mainNavView;
@property(strong,nonatomic)UIView *coverNavView;

@end

@implementation ViewController
-(UIScrollView *)mainScrollView{
    if (!_mainScrollView) {
        CGFloat height = kHeight -64;
        _mainScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kWidth, height)];
        _mainScrollView.delegate=self;
        _mainScrollView.contentSize = CGSizeMake(kWidth,100);
        _mainScrollView.scrollIndicatorInsets = UIEdgeInsetsMake(155, 0, 0, 0);
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
        [payButton setImage:@"" forState:UIControlStateNormal];
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
        _coverNavView.backgroundColor = [UIColor clearColor];
        
        UIButton *payButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [payButton setImage:@"" forState:UIControlStateNormal];
        [payButton.titleLabel sizeToFit];

        CGRect newFrame=payButton.frame;
        newFrame.origin.y = 20+10;
        newFrame.origin.x=10;
        newFrame.size.width =newFrame.size.width +10;
        payButton.frame = newFrame;
        
        UIButton *scanButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [scanButton setImage:@"" forState:UIControlStateNormal];
        [scanButton.titleLabel sizeToFit];
        newFrame.origin.x = newFrame.origin.x +40 + newFrame.size.width;
        scanButton.frame= newFrame;
        
        UIButton *searchButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [searchButton setImage:@"" forState:UIControlStateNormal];
        [searchButton.titleLabel sizeToFit];
        newFrame.origin.x = newFrame.origin.x +40 + newFrame.size.width;
        searchButton.frame  =newFrame;
        
        
        [_coverNavView addSubview:payButton];
        [_coverNavView addSubview:scanButton];
        [_coverNavView addSubview:searchButton];
        _coverNavView.alpha =0;
    }
    return _coverNavView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int topOffsetY =functionHeaderViewHeight + singleAppHeaderViewHeight;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
























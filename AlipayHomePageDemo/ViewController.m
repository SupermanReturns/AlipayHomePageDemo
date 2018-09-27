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
























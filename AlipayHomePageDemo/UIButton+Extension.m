//
//  UIButton+Extension.m
//  AlipayHomePageDemo
//
//  Created by Superman on 2018/9/27.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

-(void)alignImageAndTitleVertically:(CGFloat)padding{
    padding=6;
    CGSize imageSize=self.imageView.frame.size;
    CGSize titleSize=self.imageView.frame.size;
    CGFloat totalHeight = imageSize.height + titleSize.height +padding;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - imageSize.height),  (self.frame.size.width - imageSize.width) / 2 - 5, 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -(self.frame.size.width - titleSize.width) / 2 - 10,  -(totalHeight - titleSize.height), 0);
    
}

@end

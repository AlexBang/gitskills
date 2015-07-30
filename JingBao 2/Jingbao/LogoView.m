//
//  LogoView.m
//  Jingbao
//
//  Created by mac on 15/7/9.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "LogoView.h"
#import "Size.h"
@implementation LogoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //图片logo
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/10)];
        imageView.image = [UIImage imageNamed:@"img_LOGO.png"];
        [self addSubview:imageView];
        
        
        //搜索框
        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH*0.65, SCREEN_HEIGHT/10)];
        _searchBar.placeholder = @"搜索珠宝、商铺";
        _searchBar.backgroundImage = [UIImage imageNamed:@"bj-3.png"];
        //self.searchBar.barTintColor = [UIColor greenColor];
        [self addSubview:_searchBar];
    }
    return self;
}
@end

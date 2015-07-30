//
//  ScrollerViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ScrollerViewCell.h"
#import "Size.h"
#import "First.h"
#import "UIImageView+WebCache.h"
#import "NetworkHandler.h"
#import "Header.h"




@implementation ScrollerViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        
        self.backgroundColor = [UIColor whiteColor];
        self.pageControl.currentPage = 0;
        
        
           }
    [self p_setupSubviews];
    
    NSString * str1 = HOSTS;
    NSString * str2 = MOBILE;
    NSString * str3 = HOME_API;
    NSString * string = [str1 stringByAppendingString:str2];
    NSString * urlString = [string stringByAppendingString:str3];
    
    NSURL * url = [NSURL URLWithString:urlString];
    NetworkHandler * networkH = [[NetworkHandler alloc]init];
    [networkH getFirstListWithURL:url competion:^(id list) {
        self.firstArr = list;
        
    }];
    return self;
}

- (void)p_setupSubviews
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/4)];
    _scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.contentView addSubview:_scrollView];
    self.imgView = [[UIImageView alloc]init];
}
- (void)scrollerViewWithimg:(NSMutableArray*)firstArr

{
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*firstArr.count, SCREEN_HEIGHT/4);
    _scrollView.pagingEnabled = YES;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        //分页控件，本质上和scrollerView没有任何的关系，是两个独立的控件
        _pageControl = [[UIPageControl alloc]init];
        //总页数
        _pageControl.numberOfPages = self.firstArr.count;
        _pageControl.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/3, SCREEN_WIDTH/3, 20);
        //设置索引颜色
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        [self.contentView addSubview:_pageControl];
        // 添加监听方法
        /** 在OC中，绝大多数"控件"，都可以监听UIControlEventValueChanged事件，button除外" */
        [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

// 分页控件的监听方法
- (void)pageChanged:(UIPageControl *)page
{
    //NSLog(@"%d", page.currentPage);
    
    // 根据页数，调整滚动视图中的图片位置 contentOffset
    CGFloat x = page.currentPage * self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}


#pragma mark - ScrollView的代理方法
// 滚动视图停下来，修改页面控件的小点（页数）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 停下来的当前页数
    //NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
    
    // 计算页数
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.pageControl.currentPage = page;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

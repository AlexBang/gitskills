//
//  GoodsTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "GoodsTableViewCell.h"
#import "Size.h"
#import "DetailModel.h"

#import "NetworkHandler.h"
@implementation GoodsTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*320/1136)];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        
        [self.contentView addSubview:_scrollView];
        //添加pageControl
        UIPageControl * pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*200/640, SCREEN_HEIGHT*270/1136, 100, 30)];
        self.page = pageControl;
        pageControl.currentPage = 0;
        //设置索引颜色
        pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:129.00/255.0 green:202.00/255.0 blue:197.00/255.0 alpha:1.0];
        pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        [pageControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:pageControl];
        
       
        
    }
    return self;
}

- (void)scrollerViewWithimg:(NSMutableArray*)imgUrlArr
{
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*imgUrlArr.count, 320/1136*SCREEN_HEIGHT);
    self.page.numberOfPages = imgUrlArr.count;
    _scrollView.pagingEnabled = YES;
}

    

- (void)change:(UIPageControl *)control
{
    long currentPage = control.currentPage;
    CGPoint offset = CGPointMake(currentPage*SCREEN_WIDTH, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取偏移量
    CGPoint offset = scrollView.contentOffset;
    int pageCount = offset.x / SCREEN_WIDTH;
    self.page.currentPage = pageCount;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

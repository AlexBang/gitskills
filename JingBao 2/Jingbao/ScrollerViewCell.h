//
//  ScrollerViewCell.h
//  Jingbao
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "First.h"
@interface ScrollerViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)UIPageControl * pageControl;
@property (nonatomic,strong)First * first;
@property (nonatomic,strong)NSTimer * timer;
@property (nonatomic,strong)UIImageView * imgView;
@property (nonatomic,strong)NSMutableArray * firstArr;
- (void)scrollerViewWithimg:(NSMutableArray*)firstArr;

@end

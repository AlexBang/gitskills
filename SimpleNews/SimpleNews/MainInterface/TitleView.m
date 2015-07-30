//
//  TitleView.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/29.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 主界面标题滑动条
        UIScrollView * titleSV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
        self.titleSV = titleSV;
        titleSV.contentSize = CGSizeMake(200, 30);
        titleSV.pagingEnabled = YES;
        titleSV.bounces = NO;
        titleSV.scrollEnabled = NO;
        [self addSubview:titleSV];
        // 贴label
        for (int i = 0; i < 4; i++) {
            UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40*i, 0, 40, 20)];
            titleLabel.font = [UIFont fontWithName:@"STHUPO" size:15];
            titleLabel.textColor = [UIColor whiteColor];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            
            UILabel * egTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40*i, 20, 40, 10)];
            egTitleLabel.textAlignment = NSTextAlignmentCenter;
            egTitleLabel.font = [UIFont systemFontOfSize:8];
            
            switch (i) {
                case 0:
                    titleLabel.text = @"头条";
                    egTitleLabel.text = @"Headline";
                    break;
                case 1:
                    titleLabel.text = @"体育";
                    egTitleLabel.text = @"Sports";
                    break;
                case 2:
                    titleLabel.text = @"科技";
                    egTitleLabel.text = @"Technology";
                    egTitleLabel.frame = CGRectMake(39*i, 20, 44, 10);
                    egTitleLabel.font = [UIFont systemFontOfSize:7];
                    break;
                case 3:
                    titleLabel.text = @"汽车";
                    egTitleLabel.text = @"Car";
                    break;
                    
                default:
                    break;
            }
            [titleSV addSubview:titleLabel];
            [titleSV addSubview:egTitleLabel];
        }
        
        // 贴pageCotrol
        UIPageControl * titlePC = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 30, 40, 10)];
        self.titlePC = titlePC;
        titlePC.numberOfPages = 4;
        titlePC.pageIndicatorTintColor = [UIColor lightGrayColor];
        titlePC.currentPageIndicatorTintColor = [UIColor blueColor];
        [self addSubview:titlePC];
    }
    return self;
}

@end

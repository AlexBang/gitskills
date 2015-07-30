//
//  GoodsTableViewCell.h
//  Jingbao
//
//  Created by mac on 15/7/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface GoodsTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property (nonatomic,retain)UIScrollView* scrollView;
@property (nonatomic,retain)UIPageControl*page;
@property (nonatomic,retain)DetailModel * detaiModel;
@property (nonatomic,retain)NSMutableArray * imgUrlArr;
- (void)scrollerViewWithimg:(NSMutableArray*)imgUrlArr;
@end

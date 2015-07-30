//
//  ImgscrollerviewController.h
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"
@interface ImgscrollerviewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic,retain)NSMutableArray * imgUrlArr;
@property (nonatomic,strong)UIImageView * imgView;
@property (nonatomic,strong)UIScrollView * scrollerView;
@property (nonatomic,retain)DetailModel * detaiModel;
@end

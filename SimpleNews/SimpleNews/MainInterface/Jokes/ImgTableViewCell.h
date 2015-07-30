//
//  ImgTableViewCell.h
//  项目
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jokes.h"
@interface ImgTableViewCell : UITableViewCell
@property (nonatomic,retain)UILabel * digestLabel;
@property (nonatomic,retain)UIImageView * imgView;
@property (nonatomic,retain)Jokes * jokes;
@end

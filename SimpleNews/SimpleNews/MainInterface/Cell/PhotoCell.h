//
//  PhotoCell.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface PhotoCell : UITableViewCell

@property (nonatomic,strong)UIImageView * imgView1;

@property (nonatomic,strong)UIImageView * imgView2;

@property (nonatomic,strong)UIImageView * imgView3;

@property (nonatomic,strong)UILabel * titleLabel;

@property (nonatomic,strong)UILabel * replyCountLabel;



@property (nonatomic,strong)News * news;

@end

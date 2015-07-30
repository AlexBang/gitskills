//
//  SpecialCell.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface SpecialCell : UITableViewCell

@property (nonatomic, strong)UIImageView * imgView;

@property (nonatomic, strong)UILabel * titleLable;

@property (nonatomic, strong)UILabel * digestLable;

@property (nonatomic, strong)News * news;

//@property(nonatomic,retain)SpecialModel * specialM;

@end

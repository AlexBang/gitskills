//
//  FavouriteCollectionViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FavouriteCollectionViewCell.h"
#import "Size.h"
@implementation FavouriteCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        //图片
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetHeight(self.frame)-10)];
        
        self.imgView.backgroundColor = [UIColor redColor];
    
        [self addSubview:self.imgView];
        //商品名称
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.frame)-10, 50)];
        self.nameLable = nameLabel;
        self.nameLable.numberOfLines = 0;
        self.nameLable.text = @"你好";
        [self addSubview:self.nameLable];
        //图标
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.nameLable.frame)-8, CGRectGetWidth(self.frame)-10, 30)];
        label.text = @"￥";
        [label setTextColor:[UIColor redColor]];
        [self.contentView addSubview:label];
        
        
        
        //商品价格
        
        UILabel * priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(self.nameLable.frame)-10, CGRectGetWidth(self.frame)-10, 30)];
        self.priceLabel = priceLabel;
        [priceLabel setTextColor:[UIColor redColor]];
        self.priceLabel.text = @"10";
        [self addSubview:self.priceLabel];
        
        
    }
    return self;
}
@end

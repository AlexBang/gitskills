//
//  CategoryViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CategoryViewCell.h"

@implementation CategoryViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图片
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetHeight(self.frame)-10)];
        
        self.imgView.backgroundColor = [UIColor redColor];
        
        [self addSubview:self.imgView];
        //商品名称
        UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(self.imgView.frame)-5, CGRectGetWidth(self.frame), 50)];
        self.nameLable = nameLabel;
        
       
        [self addSubview:self.nameLable];
        //价格图标
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.nameLable.frame)-11, CGRectGetWidth(self.frame)-10, 20)];
        label.text = @"￥";
        label.textColor = [UIColor redColor];
        [self addSubview:label];
        
        //商品价格
        UILabel * priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(self.nameLable.frame)-12, CGRectGetWidth(self.frame)-11, 20)];
        priceLabel.textColor = [UIColor redColor];
        
        self.priceLabel = priceLabel;
        self.priceLabel.text = @"10";
        [self addSubview:self.priceLabel];
        
        
    }
    return self;
}

@end

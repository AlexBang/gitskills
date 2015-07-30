//
//  GoodsCell.m
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "GoodsCell.h"
#import "Size.h"
@implementation GoodsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 5*SCREEN_HEIGHT/1136, 40*SCREEN_WIDTH/640, 40*SCREEN_HEIGHT/1136)];
        imgView.image = [UIImage imageNamed:@"icon_shop1.png"];
        [self.contentView addSubview:imgView];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*51/1136, SCREEN_WIDTH, 1)];
        label.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:label];
        
        UILabel * shop = [[UILabel alloc]initWithFrame:CGRectMake(85*SCREEN_WIDTH/640, 15*SCREEN_HEIGHT/1136, 200*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136)];
        shop.text = @"黄金小屋";
        [self.contentView addSubview:shop];
        
        
        _imgView1  = [[UIImageView alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136, 100*SCREEN_WIDTH/640, 100*SCREEN_HEIGHT/1136)];
        _imgView1.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_imgView1];
        
        _descripeLabel = [[UILabel alloc]initWithFrame:CGRectMake(150*SCREEN_WIDTH/640, 55*SCREEN_HEIGHT/1136, 350*SCREEN_WIDTH/640, 85*SCREEN_HEIGHT/1136)];
        _descripeLabel.font = [UIFont boldSystemFontOfSize:15];
        _descripeLabel.text = @"这个商品你已经选择购买不能返回请买下吧，今天是特价哦机不可失时不再来你买下吧";
        _descripeLabel.numberOfLines = 0;
        [self.contentView addSubview:_descripeLabel];
        
        //符号
        UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 500/640, SCREEN_HEIGHT * 140/1136, SCREEN_WIDTH * 30/640, SCREEN_HEIGHT*13/1136)];
        
        label3.text = @"￥";
        [label3 setTextColor:[UIColor colorWithRed:141.00/255.0 green:141.00/255.0 blue:141.00/255.0 alpha:1.0]];
        [self.contentView addSubview:label3];
        
        
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(525*SCREEN_WIDTH/640, 130*SCREEN_HEIGHT/1136, SCREEN_WIDTH*100/640, 30*SCREEN_HEIGHT/1136)];
        _priceLabel.text = @"1000";
        [self.contentView addSubview:_priceLabel];
    }
    return self;
}
@end

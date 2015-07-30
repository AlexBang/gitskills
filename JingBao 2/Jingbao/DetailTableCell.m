//
//  DetailTableCell.m
//  Jingbao
//
//  Created by mac on 15/7/13.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "DetailTableCell.h"
#import "Size.h"
@implementation DetailTableCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //图片
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH *30/640, SCREEN_HEIGHT *20/1136, SCREEN_WIDTH*150/640, SCREEN_HEIGHT *150/1136)];
        imgView.backgroundColor = [UIColor cyanColor];
        self.imgView = imgView;
        
        self.imgView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:imgView];
        //商品描述
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH *200/640,SCREEN_WIDTH *20/640, SCREEN_WIDTH * 200/320,SCREEN_HEIGHT * 30/568)];
        
        _nameLabel.numberOfLines = 0;
        [_nameLabel setFont:[UIFont boldSystemFontOfSize:14]];
        
        _nameLabel.textColor = [UIColor colorWithRed:56.00/255.0 green:56.00/255.0 blue:56.00/255.0 alpha:1.0];
        [self.contentView addSubview:_nameLabel];
        //符号
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 210/640, SCREEN_HEIGHT * 80/1136, SCREEN_WIDTH * 30/640, SCREEN_HEIGHT*50/1136)];
        label.font = [UIFont boldSystemFontOfSize:25];
        label.text = @"￥";
        [label setTextColor:[UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0]];
        [self.contentView addSubview:label];
        //价格
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 260/640, SCREEN_HEIGHT * 80/1136, SCREEN_WIDTH * 220/640, SCREEN_HEIGHT*50/1136)];
        _priceLabel.font = [UIFont boldSystemFontOfSize:25];
        [_priceLabel setTextColor:[UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0]];
        
        
        [self.contentView addSubview:_priceLabel];
        
        //好评
        _evaluation_good_starLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 200/640, SCREEN_HEIGHT * 140/1136, SCREEN_WIDTH * 110/640, SCREEN_HEIGHT*18/568)];
        [_evaluation_good_starLabel setTextColor:[UIColor lightGrayColor]];
        _evaluation_good_starLabel.font = [UIFont boldSystemFontOfSize:13];
       
        _evaluation_good_starLabel.text = @"好评90%";
        [self.contentView addSubview:_evaluation_good_starLabel];
        
        //多少人付款
        _goods_salenumLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 320/640, SCREEN_HEIGHT * 140/1136, SCREEN_WIDTH * 110/640, SCREEN_HEIGHT*18/568)];
        _goods_salenumLabel.font = [UIFont boldSystemFontOfSize:13];
        _goods_salenumLabel.text = @"122人付款";
        [_goods_salenumLabel setTextColor:[UIColor lightGrayColor]];
        //_label2.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:_goods_salenumLabel];
        self.contentView.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

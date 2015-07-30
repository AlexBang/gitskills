//
//  TitleViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "TitleViewCell.h"
#import "Size.h"
@implementation TitleViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        //商品描述
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH *40/640,SCREEN_WIDTH *20/640, SCREEN_WIDTH * 260/320,SCREEN_HEIGHT * 30/568)];
        _nameLabel.text = @"不同的字体应用不同的属性不同的字体应用不同的属性不同的字体应用不同的属性";
        _nameLabel.numberOfLines = 0;
        [_nameLabel setFont:[UIFont boldSystemFontOfSize:14]];
        //_nameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_nameLabel];
        //符号
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 40/640, SCREEN_HEIGHT * 83/1136, SCREEN_WIDTH * 30/640, SCREEN_HEIGHT*50/1136)];
        label.font = [UIFont boldSystemFontOfSize:25];
        label.text = @"￥";
        [label setTextColor:[UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0]];
        [self.contentView addSubview:label];
        //价格
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 85/640, SCREEN_HEIGHT * 88/1136, SCREEN_WIDTH * 160/640, SCREEN_HEIGHT*35/1136)];
        _priceLabel.font = [UIFont boldSystemFontOfSize:25];
        [_priceLabel setTextColor:[UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0]];
        _priceLabel.text = @"100.00";
        
        [self.contentView addSubview:_priceLabel];
        //原价格
        _priceLabel1= [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 90/640, 130*SCREEN_HEIGHT/1136, 140*SCREEN_WIDTH/640, 18*SCREEN_HEIGHT/1136)];
        [self.contentView addSubview:_priceLabel1];
        _priceLabel1.text = @"100.00";
        _priceLabel1.textColor = [UIColor colorWithRed:141.00/255.0 green:141.00/255.0 blue:141.00/255.0 alpha:1.0];

        //横线
        
        UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 60/640, 140*SCREEN_HEIGHT/1136, 120*SCREEN_WIDTH/640, 1)];
        label2.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:label2];
        
        //符号
        UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 70/640, SCREEN_HEIGHT * 134/1136, SCREEN_WIDTH * 30/640, SCREEN_HEIGHT*13/1136)];
        
        label3.text = @"￥";
        [label3 setTextColor:[UIColor colorWithRed:141.00/255.0 green:141.00/255.0 blue:141.00/255.0 alpha:1.0]];
        [self.contentView addSubview:label3];
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

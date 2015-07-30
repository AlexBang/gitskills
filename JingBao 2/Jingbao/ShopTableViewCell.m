//
//  ShopTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ShopTableViewCell.h"
#import "Size.h"
#import "HJCAjustNumButton.h"

@implementation ShopTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //图片
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(80*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136, 250*SCREEN_WIDTH/1136, 150*SCREEN_HEIGHT/1136)];
        imgView.backgroundColor = [UIColor cyanColor];
        self.imgView = imgView;
        [self.contentView addSubview:imgView];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(250*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, SCREEN_WIDTH * 370/640,SCREEN_HEIGHT * 30/568)];
        self.nameLabel.text = @"不同的字体应用不同的属性不同的字体应用不同的属性不同的字体应用不同的属性";
        self.nameLabel.numberOfLines = 0;
        [self.contentView addSubview:self.nameLabel];
        
        //符号
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 250/640, SCREEN_HEIGHT * 83/1136, SCREEN_WIDTH * 30/640, SCREEN_HEIGHT*50/1136)];
        label.font = [UIFont boldSystemFontOfSize:25];
        label.text = @"￥";
        [label setTextColor:[UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0]];
        [self.contentView addSubview:label];
        //价格
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 287/640, SCREEN_HEIGHT * 88/1136, SCREEN_WIDTH * 160/640, SCREEN_HEIGHT*35/1136)];
        _priceLabel.font = [UIFont boldSystemFontOfSize:25];
        [_priceLabel setTextColor:[UIColor colorWithRed:209.00/255.0 green:0 blue:0 alpha:1.0]];
        _priceLabel.text = @"100.00";
        
        [self.contentView addSubview:_priceLabel];
        // 创建对象
        HJCAjustNumButton *btn1 = [[HJCAjustNumButton alloc] init];
        
        // 设置Frame，如不设置则默认为(0, 0, 110, 30)
        btn1.frame = CGRectMake(SCREEN_WIDTH * 280/640, SCREEN_HEIGHT * 140/1136, SCREEN_WIDTH * 160/640, SCREEN_HEIGHT*35/1136);
        
        // 内容更改的block回调
        btn1.callBack = ^(NSString *currentNum){
            NSLog(@"%@", currentNum);
        };
        
        // 加到父控件上
        [self.contentView addSubview:btn1];
    }
    return self;
}
- (void)awakeFromNib {
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

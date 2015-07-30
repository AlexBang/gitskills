//
//  ExpressCell.m
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ExpressCell.h"
#import "Size.h"
@implementation ExpressCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * expressLabel = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 160*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136)];
        expressLabel.text = @"配送方式";
        expressLabel.textColor = [UIColor colorWithRed:124.00/255.0 green:124.00/255.0 blue:124.00/255.0 alpha:1.0];
        [self.contentView addSubview:expressLabel];
        
        UILabel * choseLabel = [[UILabel alloc]initWithFrame:CGRectMake(340*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136)];
        choseLabel.text = @"普通快递";
        choseLabel.font = [UIFont boldSystemFontOfSize:14];
        [self.contentView addSubview:choseLabel];
        
        //符号
        UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 500/640, SCREEN_HEIGHT * 30/1136, SCREEN_WIDTH * 30/640, SCREEN_HEIGHT*13/1136)];
        
        label3.text = @"￥";
        [label3 setTextColor:[UIColor colorWithRed:141.00/255.0 green:141.00/255.0 blue:141.00/255.0 alpha:1.0]];
        [self.contentView addSubview:label3];
        
        
        UILabel * price = [[UILabel alloc]initWithFrame:CGRectMake(525*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 100*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136)];
        price.text = @"10";
        [self.contentView addSubview:price];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(590*SCREEN_WIDTH/640, SCREEN_HEIGHT * 20/1136, SCREEN_WIDTH*30/640, 30*SCREEN_HEIGHT/1136) ;
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_next_36x36.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
    }
    return self;
}
@end

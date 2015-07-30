//
//  BillCell.m
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BillCell.h"
#import "Size.h"
@implementation BillCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * expressLabel = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 25*SCREEN_HEIGHT/1136, 160*SCREEN_WIDTH/640, 20*SCREEN_HEIGHT/1136)];
        expressLabel.text = @"发票信息";
        [self.contentView addSubview:expressLabel];
        
        expressLabel.textColor = [UIColor colorWithRed:124.00/255.0 green:124.00/255.0 blue:124.00/255.0 alpha:1.0];
        
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(590*SCREEN_WIDTH/640, SCREEN_HEIGHT * 20/1136, SCREEN_WIDTH*30/640, 30*SCREEN_HEIGHT/1136) ;
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_next_36x36.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
    }
    return self;
}
@end

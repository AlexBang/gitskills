//
//  ChoseViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ChoseViewCell.h"
#import "Size.h"
@implementation ChoseViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20*SCREEN_HEIGHT/1136, SCREEN_WIDTH/2, SCREEN_HEIGHT*70/1136)];
        label.text = @"请选择重量、规格";
        label.textColor = [UIColor colorWithRed:56.00/255.0 green:56.00/255.0 blue:56.00/255.0 alpha:1.0];
        
        UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 20*SCREEN_HEIGHT/1136, SCREEN_WIDTH, SCREEN_HEIGHT*70/1136)];
        label1.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:label1];
        
        [self.contentView addSubview:label];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(590*SCREEN_WIDTH/640, SCREEN_HEIGHT * 45/1136, SCREEN_WIDTH*30/640, 30*SCREEN_HEIGHT/1136) ;
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_next_36x36.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        
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

//
//  InfoTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/16.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "InfoTableViewCell.h"
#import "Size.h"
@implementation InfoTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*150/1136)];
        label.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:label];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*40/640, SCREEN_HEIGHT*10/1136,SCREEN_WIDTH* 80/640, SCREEN_HEIGHT*80/1136)];
        
        CALayer * layer = [_imgView layer];
        layer.borderColor = [[UIColor colorWithRed:238.00/250.0 green:238.00/250.0 blue:238.00/250.0 alpha:1.0] CGColor];
        layer.borderWidth = 5.0f;
        
        
        [self.contentView addSubview:_imgView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH* 130/640,SCREEN_HEIGHT*20/1136, SCREEN_WIDTH/2, SCREEN_HEIGHT*20/1136)];
        
        _nameLabel.text = @"黄金小铺";
        _nameLabel.textColor = [UIColor colorWithRed:56.00/255.0 green:56.00/255.0 blue:56.00/255.0 alpha:1.0];
        [self.contentView addSubview:_nameLabel];
        //好评
        _evaluation_good_starLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 130/640, SCREEN_HEIGHT * 60/1136, SCREEN_WIDTH * 110/640, SCREEN_HEIGHT*18/568)];
        [_evaluation_good_starLabel setTextColor:[UIColor lightGrayColor]];
        _evaluation_good_starLabel.font = [UIFont boldSystemFontOfSize:13];
        
        _evaluation_good_starLabel.text = @"好评 90%";
        [self.contentView addSubview:_evaluation_good_starLabel];
        
        //多少人付款
        _goods_salenumLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 250/640, SCREEN_HEIGHT * 60/1136, SCREEN_WIDTH * 110/640, SCREEN_HEIGHT*18/568)];
        _goods_salenumLabel.font = [UIFont boldSystemFontOfSize:13];
        _goods_salenumLabel.text = @"122人付款";
        [_goods_salenumLabel setTextColor:[UIColor lightGrayColor]];
        
        [self.contentView addSubview:_goods_salenumLabel];
        UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*20/640,SCREEN_HEIGHT*100/1136 , SCREEN_WIDTH, 0.5)];
        label1.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:label1];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(590*SCREEN_WIDTH/640, SCREEN_HEIGHT * 110/1136, SCREEN_WIDTH*30/640, 30*SCREEN_HEIGHT/1136) ;
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_next_36x36.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
                     
        
        UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*35/640,SCREEN_HEIGHT * 120/1136, SCREEN_WIDTH,SCREEN_HEIGHT*20/1136)];
        label2.text = @"进入店铺";
        UILabel * a = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*150/1136, SCREEN_WIDTH, SCREEN_HEIGHT*20/1136)];
        a.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
        [self.contentView addSubview:a];
        [self.contentView addSubview:label2];
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

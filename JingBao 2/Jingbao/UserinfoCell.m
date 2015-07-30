//
//  UserinfoCell.m
//  Jingbao
//
//  Created by mac on 15/7/21.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UserinfoCell.h"
#import "Size.h"
@implementation UserinfoCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       self.contentView.backgroundColor = [UIColor colorWithRed:238.00/255.0 green:238.00/255.0 blue:238.00/255.0 alpha:1.0];
        
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 27*SCREEN_HEIGHT/1136, SCREEN_WIDTH, 120*SCREEN_HEIGHT/1136)];
        _username = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, 150*SCREEN_WIDTH/640, 22*SCREEN_HEIGHT/1136)];
        _username.text = @"徐伟";
        [imgView addSubview:_username];
        
        
        _proviceLabel = [[UILabel alloc]initWithFrame:CGRectMake(120*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, 90*SCREEN_WIDTH/640, 22*SCREEN_HEIGHT/1136)];
        _proviceLabel.text = @"广东省";
        [imgView addSubview:_proviceLabel];
        
        _cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(230*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, 90*SCREEN_WIDTH/640, 22*SCREEN_HEIGHT/1136)];
        _cityLabel.text = @"深圳市";
        [imgView addSubview:_cityLabel];
        
        
        _locaLabel = [[UILabel alloc]initWithFrame:CGRectMake(320*SCREEN_WIDTH/640, 30*SCREEN_HEIGHT/1136, 90*SCREEN_WIDTH/640, 22*SCREEN_HEIGHT/1136)];
        _locaLabel.text = @"罗湖区";
        [imgView addSubview:_locaLabel];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(590*SCREEN_WIDTH/640, SCREEN_HEIGHT * 45/1136, SCREEN_WIDTH*30/640, 30*SCREEN_HEIGHT/1136) ;
        [btn setBackgroundImage:[UIImage imageNamed:@"icon_next_36x36.png"] forState:UIControlStateNormal];
        [imgView addSubview:btn];
        imgView.image = [UIImage imageNamed:@"1-8.png"];
        
        _addLabel = [[UILabel alloc]initWithFrame:CGRectMake(30*SCREEN_WIDTH/640, 80*SCREEN_HEIGHT/1136, 500*SCREEN_WIDTH/640, 22*SCREEN_HEIGHT/1136)];
        _addLabel.font = [UIFont boldSystemFontOfSize:15];
        _addLabel.text = @"水贝二路柏林花园3栋6A";
        [imgView addSubview:_addLabel];
        
        [self.contentView addSubview:imgView];
        
        
    }
    return self;
}
@end

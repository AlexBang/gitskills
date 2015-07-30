//
//  ImgTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ImgTableViewCell.h"
#import "Size.h"
@implementation ImgTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _imgBtn.frame = CGRectMake(0, 0, 160*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136);
        
        [self.imgBtn setBackgroundImage:[UIImage imageNamed:@"icon_tw_b.png"] forState:UIControlStateNormal];
       
       
        [_imgBtn addTarget:self action:@selector(clicked1) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_imgBtn];
        
        self.goodsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.goodsBtn.frame = CGRectMake(161*SCREEN_WIDTH/640, 0, 159*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136);
         [self.goodsBtn setBackgroundImage:[UIImage imageNamed:@"icon_cs_b.png"] forState:UIControlStateNormal];
        
        
        [self.goodsBtn addTarget:self action:@selector(clicked2) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.goodsBtn];
        
        self.envoluteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.envoluteBtn.frame = CGRectMake(321*SCREEN_WIDTH/640, 0, 159*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136);
        
        
         [self.envoluteBtn setBackgroundImage:[UIImage imageNamed:@"icon_pj_b.png"] forState:UIControlStateNormal];
        [self.envoluteBtn addTarget:self action:@selector(clicked3) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.envoluteBtn];
        
        
        self.shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shopBtn.frame = CGRectMake(480*SCREEN_WIDTH/640, 0, 159*SCREEN_WIDTH/640, 70*SCREEN_HEIGHT/1136);

         [self.shopBtn setBackgroundImage:[UIImage imageNamed:@"icon_tj_b.png"] forState:UIControlStateNormal];
        [self.shopBtn addTarget:self action:@selector(clicked4) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.shopBtn];
        
       
    }
    return self;
}
- (void)clicked1
{
    
        [self.imgBtn setBackgroundImage:[UIImage imageNamed:@"icon_tw.png"] forState:UIControlStateNormal];
        [self.shopBtn setBackgroundImage:[UIImage imageNamed:@"icon_tj_b.png"] forState:UIControlStateNormal];
        [self.goodsBtn setBackgroundImage:[UIImage imageNamed:@"icon_cs_b.png"] forState:UIControlStateNormal];
        [self.envoluteBtn setBackgroundImage:[UIImage imageNamed:@"icon_pj_b.png"] forState:UIControlStateNormal];
        
    

    
   
}
- (void)clicked2
{
    
        [self.goodsBtn setBackgroundImage:[UIImage imageNamed:@"icon_cs.png"] forState:UIControlStateNormal];
        [self.envoluteBtn setBackgroundImage:[UIImage imageNamed:@"icon_pj_b.png"] forState:UIControlStateNormal];
        [self.imgBtn setBackgroundImage:[UIImage imageNamed:@"icon_tw_b.png"] forState:UIControlStateNormal];
        [self.shopBtn setBackgroundImage:[UIImage imageNamed:@"icon_tj_b.png"] forState:UIControlStateNormal];
    

    
}
- (void)clicked3
{
    
        [self.envoluteBtn setBackgroundImage:[UIImage imageNamed:@"icon_pj.png"] forState:UIControlStateNormal];
        [self.imgBtn setBackgroundImage:[UIImage imageNamed:@"icon_tw_b.png"] forState:UIControlStateNormal];
        [self.shopBtn setBackgroundImage:[UIImage imageNamed:@"icon_tj_b.png"] forState:UIControlStateNormal];
        [self.goodsBtn setBackgroundImage:[UIImage imageNamed:@"icon_cs_b.png"] forState:UIControlStateNormal];
    

    
}
- (void)clicked4
{
   
        [self.shopBtn setBackgroundImage:[UIImage imageNamed:@"icon_tj.png"] forState:UIControlStateNormal];
        [self.goodsBtn setBackgroundImage:[UIImage imageNamed:@"icon_cs_b.png"] forState:UIControlStateNormal];
        [self.envoluteBtn setBackgroundImage:[UIImage imageNamed:@"icon_pj_b.png"] forState:UIControlStateNormal];
        [self.imgBtn setBackgroundImage:[UIImage imageNamed:@"icon_tw_b.png"] forState:UIControlStateNormal];
    
    

    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end

//
//  ButtonTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ButtonTableViewCell.h"
#import "Size.h"
@implementation ButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20, 10, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        [btn setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
        
        self.btn = btn;
        [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:btn];
        
        UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn1.frame = CGRectMake(SCREEN_WIDTH/3.4, 10, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        self.btn1 = btn1;
        [btn1 setBackgroundImage:[UIImage imageNamed:@"2-3.png"] forState:UIControlStateNormal];
        
        [btn1 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn1];
        
        UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn2.frame = CGRectMake(SCREEN_WIDTH/1.8, 10, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        [btn2 setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
        self.btn2 = btn2;
        [btn2 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn2];
        
        UIButton * btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn3.frame = CGRectMake(SCREEN_WIDTH/1.25, 10, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        [btn3 setBackgroundImage:[UIImage imageNamed:@"4.png"] forState:UIControlStateNormal];
        self.btn3 = btn3;
        [btn3 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn3];
        
        UIButton * btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn4.frame = CGRectMake(20, SCREEN_HEIGHT/8, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        [btn4 setBackgroundImage:[UIImage imageNamed:@"5.png"] forState:UIControlStateNormal];
        self.btn4 = btn4;
        [btn4 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn4];
        
        UIButton * btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn5.frame = CGRectMake(SCREEN_WIDTH/3.4, SCREEN_HEIGHT/8, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        [btn5 setBackgroundImage:[UIImage imageNamed:@"6.png"] forState:UIControlStateNormal];
        self.btn5 = btn5;
        [btn5 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn5];
        
        UIButton * btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn6.frame = CGRectMake(SCREEN_WIDTH/1.8, SCREEN_HEIGHT/8, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        [btn6 setBackgroundImage:[UIImage imageNamed:@"7.png"] forState:UIControlStateNormal];
        self.btn6 = btn6;
        [btn6 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn6];
        
        UIButton * btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
        btn7.frame = CGRectMake(SCREEN_WIDTH/1.25, SCREEN_HEIGHT/8, SCREEN_WIDTH/8, SCREEN_HEIGHT/10.6);
        [btn7 setBackgroundImage:[UIImage imageNamed:@"8.png"] forState:UIControlStateNormal];
        self.btn7 = btn7;
        [btn7 addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn7];
    }
    return self;
}
- (void)clicked
{
    if (self.btn) {
        
    }else if (self.btn1){
        
    }else if (self.btn2){
        
    }else if (self.btn3){
        
    }else if (self.btn4){
        
    }else if (self.btn5){
        
    }else if (self.btn6){
        
    }else if (self.btn7){
        
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

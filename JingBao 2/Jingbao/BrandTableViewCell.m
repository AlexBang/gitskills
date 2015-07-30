//
//  BrandTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BrandTableViewCell.h"
#import "Size.h"
@implementation BrandTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //品牌区和更多按钮底色的图片
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0 , SCREEN_WIDTH, SCREEN_HEIGHT/20)];
        imageView.backgroundColor = [UIColor lightGrayColor];
        UILabel * brandLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/20, 0, SCREEN_WIDTH/5, SCREEN_HEIGHT/18)];
        brandLabel.text = @"品牌区";
        [imageView addSubview:brandLabel];
        [self.contentView addSubview:imageView];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(3*SCREEN_WIDTH/4, 5, SCREEN_WIDTH/5, SCREEN_HEIGHT/30);
        [btn setTitle:@"更多" forState:UIControlStateNormal];
        
        [self.contentView addSubview:btn];
        
        
        UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH/11.2, SCREEN_WIDTH/2, SCREEN_HEIGHT*0.28)];
        self.imgView1 = imgView1;
        imgView1.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:imgView1];
        
        
        UIImageView * imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_WIDTH/11.2, SCREEN_WIDTH/2, SCREEN_HEIGHT*0.14)];
        self.imgView2 = imgView2;
        imgView2.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:imgView2];
        
        
        UIImageView * imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_WIDTH*0.34, SCREEN_WIDTH/2, SCREEN_HEIGHT*0.139)];
        self.imgView3 = imgView3;
        imgView3.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:imgView3];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}
- (void)clicked
{
    NSLog(@"!!!!!!!!");
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

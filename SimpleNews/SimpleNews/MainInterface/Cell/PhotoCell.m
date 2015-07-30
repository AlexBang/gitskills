//
//  PhotoCell.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "PhotoCell.h"
#import "News.h"
#import "UIImageView+WebCache.h"
#import "Size.h"

@implementation PhotoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(3, 0.01 * SCREEN_HEIGHT, SCREEN_WIDTH -220, 0.25 * SCREEN_HEIGHT)];
        imgView1.backgroundColor = [UIColor redColor];
        self.imgView1 = imgView1;
        imgView1.contentMode =    UIViewContentModeScaleAspectFill;
        [imgView1.layer setMasksToBounds:YES];
        [self.contentView addSubview:imgView1];
        
        //第二个图片
        UIImageView * imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 212, 0.01 * SCREEN_HEIGHT,SCREEN_WIDTH -220 , 0.25 * SCREEN_HEIGHT)];
        imgView2.tag = 100;
        imgView2.backgroundColor = [UIColor greenColor];
        self.imgView2 = imgView2;
        imgView2.contentMode = UIViewContentModeScaleAspectFill;
        [imgView2.layer setMasksToBounds:YES];
        [self.contentView addSubview:imgView2];
        
        //第三个图片
        UIImageView * imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 107, 0.01 * SCREEN_HEIGHT, SCREEN_WIDTH -220, 0.25 * SCREEN_HEIGHT)];
        imgView3.backgroundColor = [UIColor brownColor];
        imgView3.tag = 101;
        self.imgView3 = imgView3;
        imgView3.contentMode = UIViewContentModeScaleAspectFill;
        [imgView3.layer setMasksToBounds:YES];
        [self.contentView addSubview:imgView3];
        
        
        //标题lable
        UILabel * titLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0.28 * SCREEN_HEIGHT, SCREEN_WIDTH- 20, 0.04 * SCREEN_HEIGHT)];
        titLable.font = [UIFont fontWithName:@"one" size:15];
//        titLable.text = @"篮球，让人疯狂的运动";
        self.titleLabel = titLable;
        [self.contentView addSubview:titLable];
        
        
        
    }
    
    return self;
}

- (void)setNews:(News *)news
{
    if (_news != news) {
        _news = news;
    }
    // 调用SDWebImg
    [self.imgView1 sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImg.jpeg"]];
    
    
    [self.imgView2 sd_setImageWithURL:[NSURL URLWithString:[news.imgextra[0] objectForKey:@"imgsrc"]] placeholderImage:[UIImage imageNamed:@"placeholderImg.jpeg"]];
    
    [self.imgView3 sd_setImageWithURL:[NSURL URLWithString:[news.imgextra[1] objectForKey:@"imgsrc"]] placeholderImage:[UIImage imageNamed:@"placeholderImg.jpeg"]];
    
    self.titleLabel.text = news.title;
    
    
    
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

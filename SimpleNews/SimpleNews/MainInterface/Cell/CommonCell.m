//
//  CommonCell.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "CommonCell.h"
#import "Size.h"
#import "UIImageView+WebCache.h"

@implementation CommonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(3, 0, SCREEN_WIDTH-6, 0.3 * SCREEN_HEIGHT)];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
//        imageV.layer.cornerRadius = 5;
        imageV.layer.masksToBounds = YES;
        self.imgView = imageV;
        imageV.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:imageV];
        
        //标题lable
        UILabel * titleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0.30 * SCREEN_HEIGHT, SCREEN_WIDTH*0.8, 0.05 * SCREEN_HEIGHT)];
        titleLable.font = [UIFont systemFontOfSize:14];
        titleLable.text = @"标题党";
        self.titleLabel = titleLable;
        [self.contentView addSubview:titleLable];
        
        //详情描述lable
        UILabel * digestLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0.34 * SCREEN_HEIGHT, SCREEN_WIDTH, 0.03 * SCREEN_HEIGHT)];
        digestLabel.textColor = [UIColor grayColor];
        digestLabel.font = [UIFont systemFontOfSize:10];
        digestLabel.text = @"詹皇发力，神经刀又发神经了骑士擒老鹰，赢得开门红";
        self.digestLabel = digestLabel;
        [self.contentView addSubview:digestLabel];
        
        
        
    }
    
    return self;
}

- (void)setNews:(News *)news
{
    if (_news != news) {
        _news = news;
    }
    // 调用SDWebImg
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImg.jpeg"]];
    
    self.titleLabel.text = news.title;
    
    self.digestLabel.text = news.digest;
    
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

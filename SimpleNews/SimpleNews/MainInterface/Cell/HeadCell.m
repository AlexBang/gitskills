//
//  HeadCell.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "HeadCell.h"
#import "Size.h"
#import "UIImageView+WebCache.h"

@implementation HeadCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 图片自适应
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.4 * SCREEN_HEIGHT)];
        self.imgView = imgView;
        [self.contentView addSubview:imgView];
        
        // title自适应
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0.41 * SCREEN_HEIGHT, SCREEN_WIDTH-20, 0.03 * SCREEN_HEIGHT)];
        self.titleLabel = titleLabel;
        [self.contentView addSubview:titleLabel];
        
        
        
    }
    
    return self;
}

// 重写news用于赋值
- (void)setNews:(News *)news
{
    if (_news != news) {
        _news = news;
    }
    // 调用SDWebImg
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImg.jpeg"]];
    
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

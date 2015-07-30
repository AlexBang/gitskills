//
//  SpecialCell.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "SpecialCell.h"
#import "Size.h"
#import "UIImageView+WebCache.h"

@implementation SpecialCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0.03 * SCREEN_WIDTH, 0.02 * SCREEN_HEIGHT,0.3 * SCREEN_WIDTH , 0.16*SCREEN_HEIGHT)];
        imgView.backgroundColor =[UIColor whiteColor];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        [imgView.layer setMasksToBounds:YES];
        self.imgView = imgView;
        [self.contentView addSubview:imgView];
        
        
        
        UILabel * titleLable =[[UILabel alloc]initWithFrame:CGRectMake(0.37*SCREEN_WIDTH, 0.01 * SCREEN_HEIGHT, 0.6*SCREEN_WIDTH, 0.08*SCREEN_HEIGHT)];
        titleLable.backgroundColor =[UIColor whiteColor];
        titleLable.font = [UIFont systemFontOfSize:13];
        self.titleLable = titleLable;
        [self.contentView addSubview:titleLable];
        
        
        UILabel * digestLable = [[UILabel alloc]initWithFrame:CGRectMake(0.37*SCREEN_WIDTH, 0.07*SCREEN_HEIGHT, 0.57*SCREEN_WIDTH, 0.1*SCREEN_HEIGHT)];
        digestLable.backgroundColor = [UIColor whiteColor];
        self.digestLable = digestLable;
        digestLable.font = [UIFont systemFontOfSize:10];
        digestLable.numberOfLines = 0;
        [self.contentView addSubview:digestLable];
        
        
        
    }
    return self;
}


- (void)setNews:(News *)news
{
    if (_news != news) {
        _news = news;
    }
    
    self.titleLable.text = news.title;
    self.digestLable.text = news.digest;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImg.jpeg"]];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  ImgTableViewCell.m
//  项目
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "ImgTableViewCell.h"
#import "Size.h"
@implementation ImgTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3);
        self.imgView = imgView;
        [self addSubview:imgView];
        UILabel * digestLabel = [[UILabel alloc]init];
        digestLabel.frame = CGRectMake(0, SCREEN_HEIGHT/3+10, SCREEN_WIDTH, 0);
        digestLabel.numberOfLines = 0;
        self.digestLabel = digestLabel;
        
        [self addSubview:digestLabel];
        
        
    }
    return self;
}
- (void)setJokes:(Jokes *)jokes
{
    if (_jokes != jokes) {
        _jokes = jokes;
    }
    //self.digestLabel.text = jokes.digest;
    CGRect digeatRect = [jokes.digest boundingRectWithSize:CGSizeMake(SCREEN_WIDTH,10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    NSLog(@"%f",digeatRect.size.height);
    CGRect frame = self.digestLabel.frame;
    frame.size.height = digeatRect.size.height +10;
    self.digestLabel.frame = frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

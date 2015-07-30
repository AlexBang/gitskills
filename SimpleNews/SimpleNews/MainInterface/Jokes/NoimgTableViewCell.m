//
//  NoimgTableViewCell.m
//  项目
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "NoimgTableViewCell.h"
#import "Size.h"
@implementation NoimgTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier: reuseIdentifier];
    if (self) {
        UILabel * digestLabel = [[UILabel alloc]init];
        digestLabel.frame = CGRectMake(10, 0, SCREEN_WIDTH-20, 1000000);
        self.digestLabel = digestLabel;
        digestLabel.numberOfLines = 0;
        [self addSubview:digestLabel];
        
    }
    return self;
}
- (void)setJokes:(Jokes *)jokes
{
    if (_jokes != jokes) {
        _jokes = jokes;
    }
    CGRect digeatRect = [jokes.digest boundingRectWithSize:CGSizeMake(SCREEN_WIDTH,10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    CGRect frame = self.digestLabel.frame;
    frame.size.height = digeatRect.size.height+20;
    self.digestLabel.frame = frame;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

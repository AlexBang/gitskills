//
//  HeaderTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/7.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "HeaderTableViewCell.h"
#import "Size.h"
@implementation HeaderTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
//        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/20, 5, SCREEN_WIDTH/4, SCREEN_HEIGHT/18)];
//        imgView.image = [UIImage imageNamed:@"img-logo_120x36.png"];
//        imgView.contentMode = UIViewContentModeScaleToFill;
//        [self.contentView addSubview:imgView];
//        //竖线
//        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 10, 1, SCREEN_HEIGHT/25)];
//        label.backgroundColor = [UIColor lightGrayColor];
//        [self.contentView addSubview:label];
        
        
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.34)];
        [self.contentView addSubview:imgView1];
        self.imgView1 = imgView1;
        imgView1.backgroundColor = [UIColor cyanColor];
        UIImageView * imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.5+1, 0, SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.158)];
        self.imgView2 = imgView2;
        imgView2.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:imgView2];
        
        UIImageView * imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.5+1, SCREEN_HEIGHT*0.158+1, SCREEN_WIDTH*0.28, SCREEN_HEIGHT*0.182-1)];
        self.imgView3 = imgView3;
        imgView3.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:imgView3];
        
        UIImageView * imgView4 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.78+2, SCREEN_HEIGHT*0.158+1, SCREEN_WIDTH*0.27, SCREEN_HEIGHT*0.182-1)];
        self.imgView4 = imgView4;
        imgView4.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:imgView4];

        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

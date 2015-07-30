//
//  LogoTableViewCell.m
//  Jingbao
//
//  Created by mac on 15/7/8.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "LogoTableViewCell.h"
#import "Size.h"
@implementation LogoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //图片logo
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/150, SCREEN_WIDTH, SCREEN_HEIGHT/10)];
        imageView.image = [UIImage imageNamed:@"img_LOGO.png"];
        [self.contentView addSubview:imageView];
        
        
        //搜索框
       _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/150, SCREEN_WIDTH*0.65, SCREEN_HEIGHT/10)];
        _searchBar.backgroundImage = [UIImage imageNamed:@"bj-3.png"];
       _searchBar.placeholder = @"搜索珠宝、商铺";
        //_searchBar.backgroundColor = [UIColor colorWithRed:50.59/255.0 green:75.80/255.0 blue:69.77/255.0 alpha:1.0];
        //self.searchBar.barTintColor = [UIColor greenColor];
        [self.contentView addSubview:_searchBar];
        
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

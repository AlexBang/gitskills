//
//  ImgTableViewCell.h
//  Jingbao
//
//  Created by mac on 15/7/20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgTableViewCell : UITableViewCell
@property (nonatomic,retain)UIButton * imgBtn;

@property (nonatomic, assign) BOOL btnStatus; // 状态标识
@property (nonatomic,retain)UIButton * goodsBtn;


@property (nonatomic,retain)UIButton * envoluteBtn;




@property (nonatomic,retain)UIButton * shopBtn;
@end

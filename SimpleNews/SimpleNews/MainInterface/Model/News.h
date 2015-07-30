//
//  News.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface News : NSObject

@property (strong, nonatomic)NSString *sname;//特殊新闻名

@property(nonatomic,strong)NSString * title;//标题

@property(nonatomic,strong)NSString * imgsrc;//图片网址

@property(nonatomic,strong)NSString * digest;//内容摘要

@property(nonatomic,strong)NSString * docid;//编号

@property(nonatomic,strong)NSString * ptime;//发表时间

@property(nonatomic,strong)NSArray * imgextra;//图集

@property(nonatomic,assign)int replyCount;//回复数

@property(nonatomic,retain)NSString * skipType;//跳转类型

@property(nonatomic,retain)NSString * skipID; //跳转编号

@property(nonatomic,assign)BOOL isFavorite;

@end

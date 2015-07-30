//
//  DetailModel.h
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject

@property (strong ,nonatomic)NSString * body;

@property (strong ,nonatomic)NSString * digest;

@property (strong ,nonatomic)NSString * docid;

@property (strong ,nonatomic)NSMutableArray * img;

@property (strong ,nonatomic)NSString * ptime;

@property (strong ,nonatomic)NSString * replyCount;

@property (strong ,nonatomic)NSString * source;

@property (strong ,nonatomic)NSString * title;



@end

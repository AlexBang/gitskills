//
//  NetworkHandler.h
//  DouBan37
//
//  Created by 费延亮 on 15/1/8.
//  Copyright (c) 2015年 ThirtySeven. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "News.h"

typedef void(^CallBack)(id);

@interface NetworkHandler : NSObject

@property (nonatomic, copy)CallBack callBack;

@property (nonatomic, assign)void(*func)(id);

//请求活动列表
- (void)getNewsListWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack;

- (void)getPhotoDetailWithURL:(NSURL *)url competion:(CallBack)callBack;

- (void)getTextDetailWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack;

- (void)getSpecialListWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack;

- (void)getVideoDetailWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack;

@end

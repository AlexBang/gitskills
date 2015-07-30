//
//  NetworkHandler.h
//  Jingbao
//
//  Created by mac on 15/7/9.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "First.h"

typedef void (^CallBack)(id);

@interface NetworkHandler : NSObject
@property (nonatomic,copy)CallBack callBack;
@property (nonatomic,copy)CallBack callBack2;
@property (nonatomic,copy)CallBack callBack3;
@property (nonatomic,copy)CallBack callBack4;
@property (nonatomic,copy)CallBack callBack5;//申请分类列表
@property (nonatomic,copy)CallBack callBack6;//进入列表页面
@property (nonatomic,copy)CallBack callBack7;
@property (nonatomic,copy)CallBack callBack8;
@property (nonatomic,copy)CallBack callBack9;
@property (nonatomic,copy)CallBack callBack10;
@property (nonatomic,copy)CallBack callBack11;//下单列表
@property (nonatomic,assign)void(*func)(id);
- (void)getFirstListWithURL:(NSURL*)url competion:(CallBack)callBack;
- (void)getHome2ListWithURL:(NSURL *)url competion:(CallBack)callBack2;
- (void)getHome3ListWithURL:(NSURL *)url competion:(CallBack)callBack3;
- (void)getCollectionListWithURL:(NSURL *)url competion:(CallBack)callBack4;
- (void)getCAtegoryListWithURL:(NSURL *)url competion:(CallBack)callBack5;
- (void)getGoodListWithURL:(NSURL *)url competion:(CallBack)callBack6;
- (void)getGoodListWithURL:(NSURL *)url withkey:(NSString *)key competion:(CallBack)callBack7;
- (void)getDetailinfoWithURL:(NSURL *)url withkey:(NSString *)key competion:(CallBack)callBack8;
- (void)getStoreinfoWithURL:(NSURL *)url withkey:(NSString *)key competion:(CallBack)callBack9;
- (void)getUserinfoWithURL:(NSURL *)url competion:(CallBack)callBack10;
- (void)getOrderWithURL:(NSURL *)url competion:(CallBack)callBack11;
@end

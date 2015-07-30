//
//  DBManager.h
//  LessonUI_19
//
//  Created by 费延亮 on 15/1/7.
//  Copyright (c) 2015年 ThirtySeven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

/**
 DBManager负责数据的增删改查
 
 */

@interface DBManager : NSObject

//增
- (BOOL)insertNews:(News *)news;
//删
- (BOOL)deleteAllNews;
- (BOOL)deleteNewsByTitle:(NSString *)title;
//查
- (News *)selectNewsByTitle:(NSString *)title;
- (NSArray *)selectAllNews;


//判断活动是否已经被收藏
- (BOOL)isFavorite:(NSString *)title;

@end

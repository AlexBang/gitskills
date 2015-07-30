//
//  DB.h
//  LessonUI_19
//
//  Created by 费延亮 on 15/1/7.
//  Copyright (c) 2015年 ThirtySeven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

/***
 
 DB类用来封装数据的打开和关闭操作
 
 */

@interface DB : NSObject
//打开数据库
+ (sqlite3 *)openDB;
//关闭数据库
+ (void)closeDB;




@end

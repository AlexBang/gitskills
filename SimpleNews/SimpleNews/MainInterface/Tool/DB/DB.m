//
//  DB.m
//  LessonUI_19
//
//  Created by 费延亮 on 15/1/7.
//  Copyright (c) 2015年 ThirtySeven. All rights reserved.
//

#import "DB.h"

@implementation DB

 static sqlite3 *db = NULL;
//打开数据库
+ (sqlite3 *)openDB
{
  //将student37.sqlite数据库文件拷贝到document目录下
    
    //如果db已经打开，则直接返回，不用重复打开
    if (db) {
        return db;
    }
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"News" ofType:@"sqlite"];
    
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",docPath);
    docPath  = [docPath stringByAppendingPathComponent:@"News.db"];
    
    //判断student37.sqlite是否存在
    NSFileManager * manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:docPath]) {
        //如果数据库文件不存在，则拷贝数据库文件到document目录下
        [manager copyItemAtPath:path toPath:docPath error:nil];
    }
    
  //打开数据库文件
    
    int result = sqlite3_open(docPath.UTF8String, &db);
    
    if (result == SQLITE_OK) {
        
        NSLog(@"打开数据库成功。。。");
    }else
    {
        NSLog(@"打开数据库失败。。。");
    }
    return db;

}
//关闭数据库
+ (void)closeDB
{
    int reuslt = sqlite3_close(db);
    
    if (reuslt == SQLITE_OK) {
#warning 数据库关闭后，db指针指向空
        db = NULL;
        
        NSLog(@"数据库关闭成功。。。");
    }else
    {
        NSLog(@"数据库关闭失败");
    }
    
}

@end

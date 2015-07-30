//
//  DBManager.m
//  LessonUI_19
//
//  Created by 费延亮 on 15/1/7.
//  Copyright (c) 2015年 ThirtySeven. All rights reserved.
//

#import "DBManager.h"
#import "DB.h"

@implementation DBManager

//增
- (BOOL)insertNews:(News *)news
{
    //1、打开数据库
    
    sqlite3 * db = [DB openDB];
    //2、准备sql语句
 
    NSString * sql = [NSString stringWithFormat:@"insert into favorites values('%@','%@','%@','%@','%@')",news.title,news.docid,news.ptime,news.skipType,news.skipID];
    
    //3、执行sql语句
  int reuslt =  sqlite3_exec(db, sql.UTF8String,nil,nil, nil);
    
    //关闭数据库
    [DB closeDB];
    
    if (reuslt == SQLITE_OK) {
        
        return YES;
    }else
    {
        return NO;
    }
    
    
    
    
}
//删
- (BOOL)deleteAllNews
{
    //1、打开数据库
    sqlite3 *db = [DB openDB];
    //2、准备sql语句
    NSString * sql = [NSString stringWithFormat:@"delete from favorites"];
    //3、执行sql语句
    int result = sqlite3_exec(db, sql.UTF8String, nil, nil, nil);
    
    //4、关闭数据库
    [DB closeDB];
    if (result == SQLITE_OK) {
        return YES;
    }else
    {
        return NO;
    }

}
//删除某个新闻
- (BOOL)deleteNewsByTitle:(NSString *)title
{
    //1、打开数据库
    sqlite3 * db = [DB openDB];
    //2、准备sql语句
    NSString * sql = [NSString stringWithFormat:@"delete from favorites where title = '%@'",title];
    //3、执行sql语句
    int result = sqlite3_exec(db, sql.UTF8String, nil, nil, nil);
    //4、关闭数据库
    [DB closeDB];
    
    if (result == SQLITE_OK) {
        
        return YES;
        
    }else
    {
        return NO;
    }

}


//查
- (News *)selectNewsByTitle:(NSString *)title
{
    //1、打开数据库
    sqlite3 * db = [DB openDB];
    //2、准备sql
    NSString * sql = [NSString stringWithFormat:@"select * from favorites where title = '%@'",title];
    //3、创建跟随指针
    sqlite3_stmt *stmt = nil;
    //4、判断sql语句是否正确
    int reuslt = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
    if (reuslt == SQLITE_OK) {
        //sql语句正确
        //绑定‘？’处的值
//        sqlite3_bind_text(stmt, 1, title.UTF8String, -1, nil);
        
        //5、获取返回结果
        
        int stepResult = sqlite3_step(stmt);
        
        News * news = [[News alloc] init];
        if (stepResult == SQLITE_ROW) {
            //成功取出数据
            
            news.title = [self getStringFromStmt:stmt withColumIndex:1];
            news.docid = [self getStringFromStmt:stmt withColumIndex:2];
            news.ptime = [self getStringFromStmt:stmt withColumIndex:3];
            news.skipType = [self getStringFromStmt:stmt withColumIndex:4];
            news.skipID = [self getStringFromStmt:stmt withColumIndex:5];
//            news.isFavorite = YES;
            sqlite3_finalize(stmt);
            return news;
        }
        //6、释放stmt内存
        
        
    }else
    {
        sqlite3_finalize(stmt);
      //sql语句不正确
    }

    return nil;
}
- (NSArray *)selectAllNews
{
    //1、打开数据库
    
    sqlite3 * db = [DB openDB];
    //2、准备sql
    NSString * sql = @"select * from favorites";
    
    //3、创建跟对指针
    sqlite3_stmt * stmt = nil;
    //4、判断sql是否正确
    int result = sqlite3_prepare_v2(db, sql.UTF8String, -1, &stmt, nil);
    
    if (result == SQLITE_OK) {
        //如果sql正确
        
        //5、创建数组用于存放新闻
        NSMutableArray * newsArray = [[NSMutableArray alloc] init];
        
        //6、单步执行，获取每一个结果
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
             News * news = [[News alloc] init];
            news.title = [self getStringFromStmt:stmt withColumIndex:0];
            news.docid = [self getStringFromStmt:stmt withColumIndex:1];
            news.ptime = [self getStringFromStmt:stmt withColumIndex:2];
            news.skipType = [self getStringFromStmt:stmt withColumIndex:3];
            news.skipID = [self getStringFromStmt:stmt withColumIndex:4];
            //从数据库搜索出来的活动肯定是被收藏过的
//            news.isFavorite = YES;
            [newsArray addObject:news];
            
        }
        
        sqlite3_finalize(stmt);
        
        return newsArray;
    }
    sqlite3_finalize(stmt);

    return nil;
}

- (NSString *)getStringFromStmt:(sqlite3_stmt *)stmt withColumIndex:(int)coloum
{
    const char * str = (const char *)sqlite3_column_text(stmt, coloum);
    
    if (str) {
        NSString * reStr = [NSString stringWithUTF8String:str];
        return reStr;
    }else
    {
        return nil;
    }
}

- (BOOL)isFavorite:(NSString *)title
{
    News * news = [self selectNewsByTitle:title];
    if ([news.title isEqualToString:@""]) {
        return NO;
    }else
    {
        return YES;
    }


}

@end

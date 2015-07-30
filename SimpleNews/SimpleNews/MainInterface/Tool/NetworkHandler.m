//
//  NetworkHandler.m
//  DouBan37
//
//  Created by 费延亮 on 15/1/8.
//  Copyright (c) 2015年 ThirtySeven. All rights reserved.
//

#import "NetworkHandler.h"
#import "News.h"
#import "DetailModel.h"
#import "PhotoDetailModel.h"
#import "VideoModel.h"

@implementation NetworkHandler


//请求新闻列表
- (void)getNewsListWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack
{
    //将传过来的callBack保存在属性中
    self.callBack = callBack;
    
    __block  NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSMutableArray * newsArray = [[NSMutableArray alloc] init];
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray * arr = [dic objectForKey:key];
        
        for (NSDictionary * newsDic in arr) {
            News * news = [[News alloc] init];
            
            [news setValuesForKeysWithDictionary:newsDic];
            
            [newsArray addObject:news];
            
        }
        //回掉。。。
        handler.callBack(newsArray);
        
    }];
    
}

// 请求图集新闻详情
- (void)getPhotoDetailWithURL:(NSURL *)url competion:(CallBack)callBack
{
    //将传过来的callBack保存在属性中
    self.callBack = callBack;
    
    __block  NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        PhotoDetailModel * photoDM = [[PhotoDetailModel alloc] init];
        
        [photoDM setValuesForKeysWithDictionary:dic];
            
        handler.callBack(photoDM);
        
    }];
    
}

// 请求文本新闻详情
- (void)getTextDetailWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack
{
    //将传过来的callBack保存在属性中
    self.callBack = callBack;
    
    __block  NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * detailDic = [dic objectForKey:key];
        
        
        DetailModel * detail = [[DetailModel alloc] init];
        
        [detail setValuesForKeysWithDictionary:detailDic];
        
        //回掉。。。
        handler.callBack(detail);
        
    }];
    
}



// 请求特殊新闻列表
- (void)getSpecialListWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack
{
    //将传过来的callBack保存在属性中
    self.callBack = callBack;
    
    __block  NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSMutableArray * specialArr = [[NSMutableArray alloc] init];
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * specialDic = [dic objectForKey:key];
        
        NSArray * arr = [specialDic objectForKey:@"topics"];
        
        for (NSDictionary * temDic in arr) {
            NSArray * array = [temDic objectForKey:@"docs"];
            for (NSDictionary * sDic in array) {
                
                News * specialNews = [[News alloc]init];
                specialNews.sname = [specialDic objectForKey:@"sname"];
                specialNews.digest = [sDic objectForKey:@"digest"];
                specialNews.docid = [sDic objectForKey:@"docid"];
                specialNews.imgsrc = [sDic objectForKey:@"imgsrc"];
                specialNews.title = [sDic objectForKey:@"title"];
                specialNews.ptime = [sDic objectForKey:@"ptime"];
                specialNews.skipType = [sDic objectForKey:@"skipType"];
                specialNews.skipID = [sDic objectForKey:@"skipID"];
                
                [specialArr addObject:specialNews];
            }
        }
        
        //回掉。。。
        handler.callBack(specialArr);
        
    }];
    
}


// 请求视频新闻详情
- (void)getVideoDetailWithURL:(NSURL *)url withKey:(NSString *)key competion:(CallBack)callBack
{
    //将传过来的callBack保存在属性中
    self.callBack = callBack;
    
    __block  NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

        VideoModel * video = [[VideoModel alloc] init];
        
        [video setValuesForKeysWithDictionary:dic];
        
        //回掉。。。
        handler.callBack(video);
        
    }];
    
}




@end

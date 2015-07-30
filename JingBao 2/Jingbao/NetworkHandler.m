//
//  NetworkHandler.m
//  Jingbao
//
//  Created by mac on 15/7/9.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "NetworkHandler.h"
#import "First.h"
#import "Home2Model.h"
#import "Home3Model.h"
#import "CollectionModel.h"
#import "CategoryModel.h"
#import "GoodslistModel.h"
#import "DetailModel.h"
#import "ShopModel.h"
#import "SpecModel.h"
#import "Userinfo.h"
#import "OrderModel.h"
@implementation NetworkHandler
- (void)getFirstListWithURL:(NSURL*)url competion:(CallBack)callBack
{
    self.callBack = callBack;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSMutableArray * newsArray = [[NSMutableArray alloc]init];
       // NSMutableArray * fourArray = [[NSMutableArray alloc]init];
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       
        
        NSArray * arr = dic[@"datas"];
        for (NSDictionary * dic1 in arr) {
            NSDictionary * dic2 = dic1[@"adv_list"];
            NSArray * arr1 = dic2[@"item"];
        for (NSDictionary * dic3 in arr1) {
                First * first = [[First alloc]init];
                [first setValuesForKeysWithDictionary:dic3];
                [newsArray addObject:first];
                //NSLog(@"-----------%@",first.data);
            }
                   }
     
         handler.callBack(newsArray);
      
    }];
}
- (void)getHome2ListWithURL:(NSURL *)url competion:(CallBack)callBack2
{
    self.callBack2 = callBack2;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSMutableArray * thirdArr = [[NSMutableArray alloc]init];
        
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSArray * arr = dic[@"datas"];
        for (NSDictionary * dic1 in arr) {
            NSDictionary * home2dic = dic1[@"home2"];
            Home2Model * home2 = [[Home2Model alloc]init];
            [home2 setValuesForKeysWithDictionary:home2dic];
           //NSLog(@"!!!!!!!!!!!%@",home2.rectangle1_image);
            [thirdArr addObject:home2];
            }
        
        
        handler.callBack2(thirdArr);
        
    }];
    
}
- (void)getHome3ListWithURL:(NSURL *)url competion:(CallBack)callBack3
{
    self.callBack3 = callBack3;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSMutableArray * TwelveArray = [[NSMutableArray alloc]init];
        // NSMutableArray * fourArray = [[NSMutableArray alloc]init];
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSArray * arr = dic[@"datas"];
        for (NSDictionary * dic1 in arr) {
            NSDictionary * dic2 = dic1[@"home3"];
            NSArray * arr1 = dic2[@"item"];
            for (NSDictionary * dic3 in arr1) {
                First * first = [[First alloc]init];
                [first setValuesForKeysWithDictionary:dic3];
                [TwelveArray addObject:first];
                //NSLog(@"-----------%@",first.data);
            }
        }
        
        handler.callBack3(TwelveArray);
        
    }];

    
}


- (void)getCollectionListWithURL:(NSURL *)url competion:(CallBack)callBack4
{
    self.callBack4 = callBack4;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSMutableArray * collectionArr = [[NSMutableArray alloc]init];
        // NSMutableArray * fourArray = [[NSMutableArray alloc]init];
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSArray * arr = dic[@"datas"];
        for (NSDictionary * dic1 in arr) {
            NSDictionary * dic2 = dic1[@"goods"];
            NSArray * arr1 = dic2[@"item"];
            for (NSDictionary * dic3 in arr1) {
                CollectionModel * collection = [[CollectionModel alloc]init];
                [collection setValuesForKeysWithDictionary:dic3];
                [collectionArr addObject:collection];
                
                
                
            }
        }
        
        handler.callBack4(collectionArr);
        
    }];

}
- (void)getCAtegoryListWithURL:(NSURL *)url competion:(CallBack)callBack5
{
    self.callBack5 = callBack5;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSMutableArray * categoruArr = [[NSMutableArray alloc]init];
        // NSMutableArray * fourArray = [[NSMutableArray alloc]init];
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSDictionary * dic1 = dic[@"datas"];
        NSArray * arr = dic1[@"class_list"];
        for (NSDictionary * dic2 in arr) {
        CategoryModel * category = [[CategoryModel alloc]init];
                [category setValuesForKeysWithDictionary:dic2];
                [categoruArr addObject:category];
                
            }
        
        
        handler.callBack5(categoruArr);
        
    }];

}
- (void)getGoodListWithURL:(NSURL *)url competion:(CallBack)callBack6
{
    self.callBack6 = callBack6;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSMutableArray * goodsArr = [[NSMutableArray alloc]init];
        // NSMutableArray * fourArray = [[NSMutableArray alloc]init];
        //解析
        if (data == nil) {
            return ;
        }
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSDictionary * dic1 = dic[@"datas"];
        NSArray * arr = dic1[@"goods_list"];
        for (NSDictionary * dic2 in arr) {
            GoodslistModel * gooslist = [[GoodslistModel alloc]init];
            [gooslist setValuesForKeysWithDictionary:dic2];
            [goodsArr addObject:gooslist];
            
        }
        
        handler.callBack6(goodsArr);
        
    }];

}
- (void)getGoodListWithURL:(NSURL *)url withkey:(NSString *)key competion:(CallBack)callBack7
{
    self.callBack7 = callBack7;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        if (data == nil) {
            return ;
        }
       
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSDictionary * dic1 = dic[@"datas"];
        NSString * string = dic1[key];
        DetailModel * detail = [[DetailModel alloc]init];
        //由于得到的value不是数组，用字符串分割方式解出来把URL放到一个数组里面
        NSArray * arr = [string componentsSeparatedByString:@","];
        
        detail.imgUrlArr = [NSMutableArray arrayWithArray:arr];
        
        handler.callBack7(detail.imgUrlArr);
    }];
    
}
- (void)getDetailinfoWithURL:(NSURL *)url withkey:(NSString *)key competion:(CallBack)callBack8
{
    self.callBack8 = callBack8;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        if (data == nil) {
            return ;
        }
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        
        NSDictionary * dic1 = dic[@"datas"];
        NSDictionary * dic2 = dic1[key];
        //获取详情
        DetailModel * detail = [[DetailModel alloc]init];
        
        [detail setValuesForKeysWithDictionary:dic2];
        NSLog(@"-------%@",detail.spec_value);
        handler.callBack8(detail);
        
    }];

}
//获取详情店铺的信息
- (void)getStoreinfoWithURL:(NSURL *)url withkey:(NSString *)key competion:(CallBack)callBack9
{
    self.callBack9 = callBack9;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        if (data == nil) {
            return ;
        }
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * dic1 = dic[@"datas"];
        NSDictionary * dic2 = dic1[key];
        //获取详情
        ShopModel * shop = [[ShopModel alloc]init];
        [shop setValuesForKeysWithDictionary:dic2];
        
        handler.callBack9(shop);
        
    }];
    
}
- (void)getUserinfoWithURL:(NSURL *)url competion:(CallBack)callBack10
{
    self.callBack10 = callBack10;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        if (data == nil) {
            return ;
        }
        
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * dic1 = dic[@"datas"];
       
        //获取key和nameuser
        
        Userinfo * user = [[Userinfo alloc]init];
        [user setValuesForKeysWithDictionary:dic1];
    NSLog(@"===11111%@",user.key);
        handler.callBack10(user.key);
           
      
    }];
}
- (void)getOrderWithURL:(NSURL *)url competion:(CallBack)callBack11
{
    self.callBack11 = callBack11;
    __block NetworkHandler * handler = self;
    NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //解析
        if (data == nil) {
            return ;
        }
         NSMutableArray * orderArr = [[NSMutableArray alloc]init];
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary * dic1 = dic[@"datas"];
        NSDictionary * dic2 = dic1[@"store_cart_list"];
        NSArray * arr = [dic2 allValues];
        
        for (NSDictionary * orderDic in arr) {
            NSArray * arr1 = orderDic[@"goods_list"];
            for (NSDictionary * goodsDic in arr1) {
                OrderModel * order= [[OrderModel alloc]init];
                [order setValuesForKeysWithDictionary:goodsDic];
                [orderArr addObject:order];
            }
            handler.callBack(orderArr);
        }
        
        
    }];
}
@end

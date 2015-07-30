//
//  PhotoDetailModel.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "PhotoDetailModel.h"

@implementation PhotoDetailModel

// 重写此方法用于使用kvc
- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"imgsum"]) {
        self.imgsum = value;
    }
    if ([key isEqualToString:@"photos"]) {
        NSArray * arr = value;
        self.photos = [NSMutableArray array];
        self.note = [NSMutableArray array];
        for (NSDictionary * dic in arr) {
            NSString * imgurl = [dic objectForKey:@"imgurl"];
            NSString * note = [dic objectForKey:@"note"];
            [self.note addObject:note];
            [self.photos addObject:imgurl];
        }
    }
    if ([key isEqualToString:@"setname"]) {
        self.setname = value;
    }
    if ([key isEqualToString:@"cover"]) {
        self.cover = value;
    }
}

@end

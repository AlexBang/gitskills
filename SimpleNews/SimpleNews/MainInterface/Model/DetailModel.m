//
//  DetailModel.m
//  SimpleNews
//
//  Created by lanou3g on 15/5/31.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"body"]) {
        self.body = value;
    }
    if ([key isEqualToString:@"digest"]) {
        self.digest = value;
    }
    if ([key isEqualToString:@"docid"]) {
        self.docid = value;
    }
    if ([key isEqualToString:@"ptime"]) {
        self.ptime = value;
    }
    if ([key isEqualToString:@"replyCount"]) {
        self.replyCount = value;
    }
    if ([key isEqualToString:@"source"]) {
        self.source = value;
    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
    if ([key isEqualToString:@"img"]) {
        NSArray * arr = value;
        self.img = [NSMutableArray array];
        for (NSDictionary * dic in arr) {
            NSString * src = [dic objectForKey:@"src"];
            [self.img addObject:src];
        }
    }
    
    
    
    
}

@end

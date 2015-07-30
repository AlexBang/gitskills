//
//  Jokes.m
//  项目
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Jokes.h"

@implementation Jokes
- (void)setValue:(id)value forKey:(NSString *)key

{
    if ([key isEqualToString:@"digest"]) {
        self.digest = value;
    }if ([key isEqualToString:@"imgsrc"]) {
        self.imgsrc = value;
    }
}
@end

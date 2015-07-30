//
//  UIView+Extension.m
//  Jingbao
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)


-(void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
    
}

-(CGFloat)x
{
    return self.origin.x;
    
}

-(void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
    
}

-(CGFloat)y
{
    return self.origin.y;
    
}

-(void)setWidth:(CGFloat)width
{
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;

    
}

-(CGFloat)width
{
    return self.frame.size.width;
    
}

-(void)setHeight:(CGFloat)height
{
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;

    
}

-(CGFloat)height
{
    return self.frame.size.height;
    
}
-(void)setSize:(CGSize)size
{
    
    CGRect frame = self.frame;
    
    frame.size = size;
    
    self.frame = frame;
    
}

-(CGSize)size
{
    return self.frame.size;
    
}

-(void)setOrigin:(CGPoint)origin
{
    
    CGRect frame = self.frame;
    
    frame.origin = origin;
    
    self.frame = frame;

    
}

-(CGPoint)origin
{
    return self.frame.origin;
    
}
@end

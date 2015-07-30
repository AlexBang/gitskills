//
//  MLKMenuPopover.m
//  MLKMenuPopover
//
//  Created by NagaMalleswar on 20/11/14.
//  Copyright (c) 2014 NagaMalleswar. All rights reserved.
//

#import "MLKMenuPopover.h"
#import <QuartzCore/QuartzCore.h>
#import "Size.h"


@interface MLKMenuPopover ()

@property (nonatomic,strong)UITableView * menuItemsTableView;





@end

@implementation MLKMenuPopover

@synthesize menuPopoverDelegate;



- (id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
       
        
        // Adding Container Button which will take care of hiding menu when user taps outside of menu area

                // Adding menu Items table
        _menuItemsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        
        _menuItemsTableView.dataSource = self;
        _menuItemsTableView.delegate = self;
        _menuItemsTableView.scrollEnabled = NO;
        [self addSubview:_menuItemsTableView];
        
        //[self.containerButton addSubview:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"价格排序";
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:1 animations:^{
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

    
}



@end



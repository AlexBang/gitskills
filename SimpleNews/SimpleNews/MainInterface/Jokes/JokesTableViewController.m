//
//  JokesTableViewController.m
//  项目
//
//  Created by lanou3g on 15/6/2.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "JokesTableViewController.h"
#import "Jokes.h"
#import "NoimgTableViewCell.h"
#import "ImgTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Size.h"
#import "MJRefresh.h"
@interface JokesTableViewController ()

@end

@implementation JokesTableViewController


static int count = 1;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"段子";
        
        UITabBarItem * item = [[UITabBarItem alloc]initWithTitle:@"段子" image:nil tag:100];
        self.tabBarItem = item;
        
        NSURLRequest * req  = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://c.m.163.com/recommend/getChanListNews?passport=&devId=357070055128385&size=20&channel=duanzi"]];
        [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (data) {
                NSMutableArray * arr  =[NSMutableArray array];
                NSArray * jokesArr  = [dic objectForKey:@"段子"];
                for (NSDictionary * jokesDic in jokesArr) {
                    Jokes * jokes = [[Jokes alloc]init];
                    [jokes setValuesForKeysWithDictionary:jokesDic];
                    [arr addObject:jokes];
                    self.arr  = arr;
                }
                [self.tableView reloadData];
            }
            
        }];
        
    }
    return self;
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
  [self addFooter];//上拉加载数据
    
    
}
//上拉加载数据
- (void)addFooter
{
    self.arr = nil;
    __weak JokesTableViewController * jokesVC = self;
    [self.tableView addLegendFooterWithRefreshingBlock:^{
    
            [jokesVC call];
    
        
        
        
    }];
    
}
- (void)call
{
    count++;
    NSString * str = [NSString stringWithFormat:@"http://c.m.163.com/recommend/getChanRecomNews?passport=&devId=357070055128385&size=%d&channel=duanzi",count*20];
    NSURLRequest * req  = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    [NSURLConnection sendAsynchronousRequest:req queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (data) {
            NSMutableArray * arr  =[NSMutableArray array];
            NSArray * jokesArr  = [dic objectForKey:@"段子"];
            for (NSDictionary * jokesDic in jokesArr) {
                Jokes * jokes = [[Jokes alloc]init];
                [jokes setValuesForKeysWithDictionary:jokesDic];
                [arr addObject:jokes];
                
            }
            self.arr = arr;
            
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }
        
    }];
}
//- (void)setJokes:(Jokes *)jokes
//{
//    if (_jokes != jokes) {
//        _jokes = jokes;
//    }
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Jokes * j = [self.arr objectAtIndex:indexPath.row];
    
    if (j.imgsrc != nil) {
        ImgTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"imgCell"];
        if (cell == nil) {
            cell = [[ImgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imgCell"];
        }
        cell.digestLabel.text = j.digest;
        cell.jokes = [self.arr objectAtIndex:indexPath.row];
        [cell.imgView sd_setImageWithURL:j.imgsrc placeholderImage:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else
    {
        NoimgTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"noimgCell"];
        if (cell == nil) {
            cell = [[NoimgTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"noimgCell"];
        }
        cell.digestLabel.text = j.digest;
        cell.jokes = [self.arr objectAtIndex:indexPath.row];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Jokes * j = [self.arr objectAtIndex:indexPath.row];

    if (j.imgsrc) {
         CGRect digeatRect = [j.digest boundingRectWithSize:CGSizeMake(SCREEN_WIDTH,10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        
        
        return SCREEN_HEIGHT/3+digeatRect.size.height+25;
    } else {
    
        
              return [j.digest boundingRectWithSize:CGSizeMake(SCREEN_WIDTH,10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height+20;
          }
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

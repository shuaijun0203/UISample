//
//  NewsViewControllerTableViewController.m
//  UISample
//
//  Created by guest on H27/06/09.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import "NewsViewControllerTableViewController.h"
#import "News.h"
#import "NewsDetailViewController.h"
#import "NewsViewControllerTableViewController.h"
#import "YQL.h"

@interface NewsViewControllerTableViewController ()

@end

@implementation NewsViewControllerTableViewController
    NSMutableArray *_newsArray;


@synthesize newsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //        YAHOO json parse TEST!!!
    YQL *yql = [[YQL alloc] init];
    NSString *queryString = @"select * from feed where url='http://rss.news.yahoo.com/rss/topstories'";
    
    NSDictionary *results = [yql query:queryString];
    
    NSInteger newsCount = results.count;
    
//    NSLog(@"%@",results[@"query"][@"results"][@"item"][0]);
    _newsArray = [NSMutableArray arrayWithCapacity:newsCount];
    for (int i = 0; i <= 39; i++) {
        News *newsModel = [[News alloc] init];
        
        NSDictionary *newsText = results[@"query"][@"results"][@"item"][i][@"text"];
        NSString *newsContent = [newsText objectForKey:@"content"];
        
        NSString *prefix = @"</a>";
        NSString *suffix = @"</p><br clear=\"all\"/>";
        
        NSRange contentsRangePrefix = [newsContent rangeOfString:prefix];

        NSString *newNewsContent = [newsContent substringFromIndex:contentsRangePrefix.location+4];
        
        NSRange contentsRangeSuffix = [newNewsContent rangeOfString:suffix];

        newNewsContent = [newNewsContent substringToIndex:contentsRangeSuffix.location];
        newsModel.newsContents = newNewsContent;
        
        newsModel.newsTitle = results[@"query"][@"results"][@"item"][i][@"title"];
        newsModel.newsURL = results[@"query"][@"results"][@"item"][i][@"link"];
        NSString *dateString = results[@"query"][@"results"][@"item"][i][@"pubDate"];
        
//        NSString *newDate = [dateString substringWithRange:NSMakeRange(0, 16)];
        newsModel.pubDate = [dateString substringWithRange:NSMakeRange(0, 16)];
        NSDictionary *contents = results[@"query"][@"results"][@"item"][i][@"content"];
        NSString *iconURL = [contents objectForKey:@"url"];
        
        NSRange urlRange = [iconURL rangeOfString:@"/http://"];
        NSString *newImageURL = [iconURL substringFromIndex:urlRange.location+1];

        newsModel.newsImage = newImageURL;
        newsModel.newsIcon = iconURL;
        newsModel.newsSource = @"Associated Press";
        [_newsArray addObject:newsModel];
        
    }
    // Override point for customization after application launch.
    
    
    UITabBarController *tabBarController = (UITabBarController *)self.tabBarController;

    UINavigationController *navigationController = [tabBarController viewControllers][0];
    
    NewsViewControllerTableViewController *newsViewController = [navigationController viewControllers][0];
    newsViewController.newsArray = _newsArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];

    NSLog(@"The News is %@",[newsArray[indexPath.row] newsTitle]);
    
    
    // Display Alert Message
    //[messageAlert show];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 14;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"NewsCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    if ( cell == nil )
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
    News *news = (self.newsArray)[indexPath.row];
    cell.textLabel.text = news.newsTitle;
    cell.detailTextLabel.text = news.pubDate;
    
//    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 50, 50)];
//    NSLog(@"the icon is %@" ,@"Finder-icon.png");
//    imv.image=[UIImage imageNamed:news.newsIcon];
//    [cell.contentView addSubview:imv];
    
    NSURL *url = [NSURL URLWithString:news.newsIcon];
    NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img = [[UIImage alloc] initWithData:data];
    
    cell.imageView.image = [UIImage imageWithData:data];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showNewsDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
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

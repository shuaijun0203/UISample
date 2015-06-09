//
//  AppDelegate.m
//  UISample
//
//  Created by guest on H27/06/02.
//  Copyright (c) 平成27年 JEC. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
#import "PlayersViewControllerTableViewController.h"
#import "NewsViewControllerTableViewController.h"
#import "news.h"
#import "YQL.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

    NSMutableArray *_players;
    NSMutableArray *_newsArray;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
    //        YAHOO json parse TEST!!!
    YQL *yql = [[YQL alloc] init];
    NSString *queryString = @"select * from feed where url='http://rss.news.yahoo.com/rss/topstories'";
    
    NSDictionary *results = [yql query:queryString];
    
    NSDictionary *contents = results[@"query"][@"results"][@"item"][3][@"content"];
    NSString *url = [contents objectForKey:@"url"];
    
    NSInteger newsCount = results.count;
    _newsArray = [NSMutableArray arrayWithCapacity:newsCount];
    
//    NSLog(@"%@",results[@"query"][@"results"][@"item"][1][@"content"]);
//    
    NSLog(@"$$$$$$ %@",results[@"query"][@"results"][@"item"][0][@"link"]);
//    NSLog(@"%@",results[@"query"][@"results"][@"item"][1][@"pubDate"]);
//    NSLog(@"%@",results[@"query"][@"results"][@"item"][1][@"title"]);
//    NSLog(@"%@",results[@"query"][@"results"][@"item"][1][@"description"]);
    news *newsModel = [[news alloc] init];

    for (int i = 0; i <= 39; i++) {
        NSLog(@"news Title is %@ %i",results[@"query"][@"results"][@"item"][i][@"title"],i);
        newsModel.newsTitle = results[@"query"][@"results"][@"item"][i][@"title"];
        newsModel.newsURL = results[@"query"][@"results"][@"item"][i][@"link"];
        
        NSString *dateString = results[@"query"][@"results"][@"item"][1][@"pubDate"];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss a"];
        NSDate *pubDate = [df dateFromString: dateString];
        newsModel.pubDate = pubDate;
    }
    
    [_newsArray addObject:newsModel];
    
    //newsModel.newsIcon =
//    NSString *contents = results[@"query"][@"results"][@"item"][1][@"content"][@"url"];
    //NSArray *contentsArray = [contents componentsSeparatedByString:@";"];
    //NSLog(@"%lu",(unsigned long)contentsArray.count);
    

    //NSLog(contentsArray);
    // Override point for customization after application launch.
    _players = [NSMutableArray arrayWithCapacity:20];
    
    Player *player = [[Player alloc] init];
    player.name = @"Bill Evans";
    player.game = @"Tic-Tac-Toe";
    player.rating = 4;
    [_players addObject:player];
    
    player = [[Player alloc] init];
    player.name = @"Oscar Peterson";
    player.game = @"Spin the Bottle";
    player.rating = 5;
    [_players addObject:player];
    
    player = [[Player alloc] init];
    player.name = @"Dave Brubeck";
    player.game = @"Texas Hold’em Poker";
    player.rating = 2;
    [_players addObject:player];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [tabBarController viewControllers][0];
    
    PlayersViewControllerTableViewController *playersViewController = [navigationController viewControllers][0];
    playersViewController.players = _players;
//    NewsViewControllerTableViewController *newsViewController = [navigationController viewControllers][0];
//    newsViewController.newsArray = _newsArray;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

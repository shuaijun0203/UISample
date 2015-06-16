//
//  NewsDetailViewController.m
//  UISample
//
//  Created by guest on H27/06/10.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NewsWebViewController.h"

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

@synthesize newsModel;
@synthesize newsDate;
@synthesize newsTitle;
@synthesize newsSource;
@synthesize newsImage;
@synthesize newsContents;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    newsTitle.text = newsModel.newsTitle;
    newsDate.text = newsModel.pubDate;
    newsSource.text = newsModel.newsSource;
    newsContents.text = newsModel.newsContents;
    NSURL *imageURL = [NSURL URLWithString:newsModel.newsImage];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            newsImage.image = [UIImage imageWithData:imageData];
        });
    });
    
}

- (IBAction)readMoreButton:(id)sender{
    
//    NewsWebViewController *newsWVC =
//    [self performSegueWithIdentifier:@"NewsWeb" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"NewsWeb"]) {

        NewsWebViewController *newsWVC = [segue destinationViewController];
        newsWVC.newsURL = self.newsModel.newsURL;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

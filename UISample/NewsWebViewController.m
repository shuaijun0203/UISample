//
//  NewsWebViewController.m
//  UISample
//
//  Created by guest on H27/06/12.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import "NewsWebViewController.h"

@interface NewsWebViewController ()


@end


@implementation NewsWebViewController


@synthesize newsWeb;
@synthesize newsURL;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsWeb.delegate = self;
    NSURL *url = [[NSURL alloc] initWithString:newsURL];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.newsWeb loadRequest:request];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *)webview
{
    if ([[self.newsWeb stringByEvaluatingJavaScriptFromString:@"document.readyState"] isEqualToString:@"complete"]) {
        // UIWebView object has fully loaded.
        NSLog(@"loaded");
    }
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

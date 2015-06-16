//
//  NewsWebViewController.h
//  UISample
//
//  Created by guest on H27/06/12.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsWebViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *newsWeb;
@property (weak,nonatomic) NSString *newsURL;

@end

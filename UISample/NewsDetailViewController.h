//
//  NewsDetailViewController.h
//  UISample
//
//  Created by guest on H27/06/10.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsDetailViewController : UIViewController
@property (weak,nonatomic) News *newsModel;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsSource;
@property (weak, nonatomic) IBOutlet UILabel *newsDate;
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UITextView *newsContents;
- (IBAction)readMoreButton:(id)sender;



@end

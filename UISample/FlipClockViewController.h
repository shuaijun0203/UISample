//
//  FlipClockViewController.h
//  UISample
//
//  Created by guest on H27/06/12.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipClockViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImage *image1;
@property (weak, nonatomic) IBOutlet UIImage *image2;
@property (weak, nonatomic) IBOutlet UIView *viewTop;
@property (weak, nonatomic) IBOutlet UIView *viewBottom;

- (IBAction)flipImage:(id)sender;
@end

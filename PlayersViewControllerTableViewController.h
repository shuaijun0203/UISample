//
//  PlayersViewControllerTableViewController.h
//  UISample
//
//  Created by guest on H27/06/03.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersViewControllerTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *players;

- (UIImage *)imageForRating:(int)rating;
@end

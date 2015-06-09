//
//  news.h
//  UISample
//
//  Created by guest on H27/06/09.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface news : NSObject
@property (nonatomic, copy) NSString *newsIcon;
@property (nonatomic, copy) NSString *newsURL;
@property (nonatomic, copy) NSString *newsTitle;
@property (nonatomic, assign) NSDate *pubDate;
@end

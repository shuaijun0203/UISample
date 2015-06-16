//
//  news.h
//  UISample
//
//  Created by guest on H27/06/09.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic, copy) NSString *newsIcon;
@property (nonatomic, copy,nullable) NSString *newsImage;
@property (nonatomic, copy) NSString *newsURL;
@property (nonatomic, copy) NSString *newsTitle;
@property (nonatomic, copy) NSString *pubDate;
@property (nonatomic, copy) NSString *newsSource;
@property (nonatomic, copy) NSString *newsContents;



@end

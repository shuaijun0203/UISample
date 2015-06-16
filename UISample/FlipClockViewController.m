//
//  FlipClockViewController.m
//  UISample
//
//  Created by guest on H27/06/12.
//  Copyright (c) 平成27年 je.ac.jec.15cm. All rights reserved.
//

#import "FlipClockViewController.h"

@interface FlipClockViewController ()

@end

@implementation FlipClockViewController

@synthesize image1;
@synthesize image2;
@synthesize viewTop;
@synthesize viewBottom;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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



- (IBAction)flipImage:(id)sender {
    
    viewTop.backgroundColor = [UIColor redColor];
    
    viewBottom.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:viewTop];
    [self.view addSubview:viewBottom];
    
    viewTop.transform = CGAffineTransformMakeTranslation(1, -1);

    
    // 追加と同時に行うとアニメーションしないので、サンプルでは処理をちょっとだけ遅延させています
//    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_MSEC));
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        [UIView transitionFromView:viewBottom toView:viewTop duration:1 options:UIViewAnimationOptionTransitionFlipFromTop completion:^(BOOL finished) {
//            NSLog(@"Animation end.");
//        }];
//
//    });
}
@end

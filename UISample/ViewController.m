//
//  ViewController.m
//  UISample
//
//  Created by guest on H27/06/02.
//  Copyright (c) 平成27年 JEC. All rights reserved.
//

#import "ViewController.h"
#import "YQL.h"
#import "PlayersViewControllerTableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PlayersViewControllerTableViewController *pvc = [[PlayersViewControllerTableViewController alloc] init];
    
    [self.view addSubview:pvc];
    
    // Do any additional setup after loading the view, typically from a nib.
//    
//    int (^calcTimes)(int, int) = ^(int num1, int num2) {
//        return num1 * num2;
//    };
//    
//    int result = calcTimes(8, 4); // Result is 32.
//    
//    int (^calcDivide)(int, int) = ^(int num1, int num2) {
//        return num1 / num2;
//    };
//    int result2 = calcDivide(8, 4); // Result is 2.
//    
//    int (^calcMinus)(int, int) = ^(int num1, int num2) {
//        return num1 - num2;
//    };
//    int result3 = calcMinus(7, 4); // Result is 3.
//    
//    int (^calcPlus)(int, int) = ^(int num1, int num2) {
//        return num1 + num2;
//    };
//    int result4 = calcPlus(7, 4); // Result is 11.
//    
//    
//    NSLog(@"result is %i %i %i %i ",result,result2,result3,result4);

}

//- (int) doSomethingWith:(int)Msg withWparam:(int)wParam withParameter:(int) lParam
//{
//    NSLog(@"MSg:%d wParam:%u lParam:%u",Msg,wParam,lParam);
//    //not working
//    return 1;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

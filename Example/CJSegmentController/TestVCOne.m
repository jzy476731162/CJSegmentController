//
//  TestVCOne.m
//  CJSegmentControllerDemo
//
//  Created by Carl Ji on 16/10/31.
//  Copyright © 2016年 Carl Ji. All rights reserved.
//

#import "TestVCOne.h"

@interface TestVCOne ()

@end

@implementation TestVCOne

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view setBackgroundColor:[UIColor yellowColor]];
    });
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

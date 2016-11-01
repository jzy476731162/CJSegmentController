//
//  TestVCTwo.m
//  CJSegmentControllerDemo
//
//  Created by Carl Ji on 16/10/31.
//  Copyright © 2016年 Carl Ji. All rights reserved.
//

#import "TestVCTwo.h"
#import "UIViewController+BarButtonItem.h"

@interface TestVCTwo ()

@property (strong, nonatomic)  UIBarButtonItem *editButton;
@property (strong, nonatomic)  UIBarButtonItem *deleteButton;

@property (strong, nonatomic)  UIBarButtonItem *cancelButton;
@property (strong, nonatomic) UIBarButtonItem *doneButton;

@end

@implementation TestVCTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButtonItem];
}

- (void)setupButtonItem {
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    self.doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    
    self.editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editAction)];
    self.deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"delete" style:UIBarButtonItemStylePlain target:self action:@selector(deleteAction)];
    
    [self setLeftBarItem:self.editButton];
    [self setRightBarItem:self.cancelButton];
}


#pragma mark - Action
- (IBAction)changeBarButtonItem:(UIButton *)sender {
    if (self.leftBarItem == self.editButton) {
        self.leftBarItem = self.cancelButton;
        self.rightBarItem = self.doneButton;
    }else if (self.leftBarItem == self.cancelButton) {
        self.leftBarItem = self.editButton;
        self.rightBarItem = self.deleteButton;
    }
}

- (void)cancelAction {
    
}

- (void)doneAction {
    
}

- (void)editAction {
    
}

- (void)deleteAction {
    
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

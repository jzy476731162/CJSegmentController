//
//  UIViewController+BarButtonItem.m
//  CJSegmentControllerDemo
//
//  Created by Carl Ji on 16/10/31.
//  Copyright © 2016年 Carl Ji. All rights reserved.
//

#import "UIViewController+BarButtonItem.h"

#import <objc/runtime.h>

static const NSString *rightKey = @"CJRightItemKey";
static const NSString *leftKey = @"CJLeftItemKey";

@implementation UIViewController (BarButtonItem)

- (void)setRightBarItem:(UIBarButtonItem *)rightBarItem {
    objc_setAssociatedObject(self, &rightKey, rightBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.parentViewController) {
        self.parentViewController.navigationItem.rightBarButtonItem = rightBarItem;
    }
}

- (void)setLeftBarItem:(UIBarButtonItem *)leftBarItem {
    objc_setAssociatedObject(self, &leftKey, leftBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.parentViewController) {
        self.parentViewController.navigationItem.leftBarButtonItem = leftBarItem;
    }
}

- (UIBarButtonItem *)leftBarItem {
    return objc_getAssociatedObject(self, &leftKey);
}

- (UIBarButtonItem *)rightBarItem {
    return objc_getAssociatedObject(self, &rightKey);
}

- (NSString *)segmentTitle {
    return self.title ? : @"标题";
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    
    [self.parentViewController.navigationItem setLeftBarButtonItem:self.leftBarItem];
    [self.parentViewController.navigationItem setRightBarButtonItem:self.rightBarItem];
}


@end

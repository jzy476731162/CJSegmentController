//
//  UIViewController+BarButtonItem.h
//  CJSegmentControllerDemo
//
//  Created by Carl Ji on 16/10/31.
//  Copyright © 2016年 Carl Ji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BarButtonItem)


/**
 leftBarButtonItem:
 
 You should set this property with your left barbuttonItem if you want this barbutton show on the left of Parent navigationBar
 */
@property (nonatomic, strong) UIBarButtonItem *leftBarItem;


/**
 rightBarButtonItem
 
 You should set this property with your right barbuttonItem if you want this barbutton show on the right of Parent navigationBar
 */
@property (nonatomic, strong) UIBarButtonItem *rightBarItem;


/**
 Don't Call by yourself
 */
- (NSString *)segmentTitle;

@end

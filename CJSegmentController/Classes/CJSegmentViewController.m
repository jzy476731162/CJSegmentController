//
//  CJSegmentViewController.m
//  CJSegmentControllerDemo
//
//  Created by Carl Ji on 16/10/31.
//  Copyright © 2016年 Carl Ji. All rights reserved.
//

#import "CJSegmentViewController.h"
#import "UIViewController+BarButtonItem.h"

typedef NS_ENUM(NSInteger, SHSegmentDirection) {
    SHSegmentDirectionBackward = -1,
    SHSegmentDirectionForward = 1,
};

@interface CJSegmentViewController ()

@property (strong, nonatomic) UIView *container;

@property (nonatomic, strong) UISegmentedControl *segment;

@property (nonatomic, assign) NSUInteger currentIndex;


@property (nonatomic, strong) NSMutableArray *vcList;

@property (nonatomic, strong) UIColor *tintColor;

@end

@implementation CJSegmentViewController


- (instancetype)initWithViewControllers:(NSArray *)viewControllers TintColor:(UIColor *)tintColor{
    self = [super init];
    if (self) {
        _tintColor = tintColor;
        
        UIView *container = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _vcList = [NSMutableArray arrayWithArray:viewControllers];
        [self.view addSubview:container];
        [container setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        NSMutableArray *constraints = [[NSMutableArray alloc] init];
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[container]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(container)]];
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[container]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(container)]];
        self.container = container;
        [self.view addConstraints:constraints];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.vcList.count) {
        NSMutableArray *titleList = [NSMutableArray new];
        for (UIViewController *vc in self.vcList) {
            [titleList addObject:[vc segmentTitle]];
            vc.view;
        }
        
        UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:titleList];
        seg.tintColor = [UIColor blackColor];
        seg.apportionsSegmentWidthsByContent = YES;
        self.navigationItem.titleView = seg;
        [seg addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
        seg.selectedSegmentIndex = 0;
        if (!self.tintColor) {
            self.tintColor = [UIColor blackColor];
        }
        [seg setTintColor:self.tintColor];
        self.segment = seg;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self displayContentController:self.vcList[0]];
        });
    }
}

- (void)displayContentController:(UIViewController *)content {
    for (UIView *subview in self.container.subviews) {
        [subview removeFromSuperview];
    }
    
    [self addChildViewController:content];
    content.view.frame = self.container.frame;
    [self.container addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void)transiteFromVC:(UIViewController *)oldVC ToVC:(UIViewController *)newVC Direction:(SHSegmentDirection)direction{
    [oldVC willMoveToParentViewController:nil];
    [self addChildViewController:newVC];
    
    CGFloat newOriginX = direction < 0 ? oldVC.view.frame.origin.x - oldVC.view.frame.size.width: oldVC.view.frame.origin.x + oldVC.view.frame.size.width;
    CGFloat oldOriginX = direction < 0 ? oldVC.view.frame.origin.x + oldVC.view.frame.size.width: oldVC.view.frame.origin.x - oldVC.view.frame.size.width;
    
    newVC.view.frame = CGRectMake(newOriginX, oldVC.view.frame.origin.y, oldVC.view.frame.size.width, oldVC.view.frame.size.height);
    
    CGRect OldVCEndFrame = CGRectMake(oldOriginX, oldVC.view.frame.origin.y, oldVC.view.frame.size.width, oldVC.view.frame.size.height);
    CGRect NewVCEndFrame = oldVC.view.frame;
    
    [self transitionFromViewController:oldVC toViewController:newVC duration:0.25 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        newVC.view.frame = NewVCEndFrame;
        oldVC.view.frame = OldVCEndFrame;
    } completion:^(BOOL finished) {
        [oldVC removeFromParentViewController];
        [self displayContentController:newVC];
    }];
    
}

- (void)segmentValueChanged:(UISegmentedControl *)sender {
    UIViewController *oldVC = self.vcList[self.currentIndex];
    UIViewController *newVC = self.vcList[sender.selectedSegmentIndex];
    
    [self.vcList replaceObjectAtIndex:self.currentIndex withObject:oldVC];
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    
    [self transiteFromVC:oldVC ToVC:newVC Direction:self.currentIndex < sender.selectedSegmentIndex? SHSegmentDirectionForward:SHSegmentDirectionBackward];
    
    self.currentIndex = sender.selectedSegmentIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end

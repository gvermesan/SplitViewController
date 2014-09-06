//
//  GVEmptyViewController.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 9/6/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVEmptyViewController.h"
#import "GVEmptyView.h"

@interface GVEmptyViewController ()

@end

@implementation GVEmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GVEmptyView *emptyView = [[GVEmptyView alloc] initWithFrame:CGRectZero];
    emptyView.backgroundColor = [UIColor whiteColor];
    emptyView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:emptyView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(emptyView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[emptyView]|" options:0 metrics:nil views:views];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[emptyView]|" options:0 metrics:nil views:views];
    [self.view addConstraints:constraints];
}

@end

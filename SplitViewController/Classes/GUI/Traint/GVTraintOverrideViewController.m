//
//  GVTraintOverrideViewController.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 9/6/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVTraintOverrideViewController.h"

@interface GVTraintOverrideViewController ()

@property (nonatomic, copy) UITraitCollection *traitCollection;

@end

@implementation GVTraintOverrideViewController

@synthesize traitCollection = _traitCollection;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    if (size.width > 320.f) {
        self.traitCollection = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassRegular];
    } else {
        self.traitCollection = nil;
    }
    
    [self setOverrideTraitCollection:self.traitCollection forChildViewController:self.viewController];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

#pragma mark - Property

- (void)setViewController:(UIViewController *)viewController {
    if ([_viewController isEqual:viewController]) {
        return;
    }
      
    _viewController = viewController;
    
    UIView *view = _viewController.view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:view];
    [self addChildViewController:_viewController];
    
    [self layoutViewController];
    [self setOverrideTraitCollection:self.traitCollection forChildViewController:_viewController];
    
}

- (void)layoutViewController {
    NSArray *constraints;
    id view = _viewController.view;
    NSDictionary *views = NSDictionaryOfVariableBindings(view);
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:views];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:views];
    [self.view addConstraints:constraints];
    
}
@end

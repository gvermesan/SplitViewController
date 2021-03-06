//
//  GVManager.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVManager.h"
#import "MenuViewController.h"
#import "GVEmptyViewController.h"
#import "GVTraintOverrideViewController.h"
#import "UIViewController+Helper.h"

@interface GVManager () <UISplitViewControllerDelegate>

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UISplitViewController *splitViewController;
@property (nonatomic, strong) GVTraintOverrideViewController *traintViewController;

@end
@implementation GVManager

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self class] new];
    });
    return sharedInstance;
}

- (UIViewController *)rootViewController {
    return self.traintViewController;
}

#pragma mark - Property

- (UINavigationController *)navigationController {
    if (!_navigationController) {
        MenuViewController *menuVC = [MenuViewController new];
        _navigationController = [[UINavigationController alloc] initWithRootViewController:menuVC];
    }
    return _navigationController;
}

- (UISplitViewController *)splitViewController {
    if (!_splitViewController) {
        GVEmptyViewController *emptyVC = [GVEmptyViewController new];
        _splitViewController = [UISplitViewController new];
        _splitViewController.delegate = self;
        _splitViewController.viewControllers = @[self.navigationController, emptyVC];
        _splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    }
    return _splitViewController;
}

- (GVTraintOverrideViewController *)traintViewController {
    if (!_traintViewController) {
        _traintViewController = [GVTraintOverrideViewController new];
        _traintViewController.viewController = self.splitViewController;
    }
    return _traintViewController;
}

#pragma mark - UISplitViewCpntrollerDelegate

- (BOOL)splitViewController:(UISplitViewController *)splitViewController
collapseSecondaryViewController:(UIViewController *)secondaryViewController
  ontoPrimaryViewController:(UIViewController *)primaryViewController {
    
    GVPhoto *photo = [secondaryViewController photoForViewController];
    
    return photo ? NO : YES;
}

- (UIViewController *)splitViewController:(UISplitViewController *)splitViewController separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController {
    
    if ([primaryViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *primaryNavController = (UINavigationController *)primaryViewController;
        for (UIViewController *viewController in [primaryNavController viewControllers] ) {
            GVPhoto *photo = [viewController photoForViewController];
            if (photo) {
                return nil;
            }
        }
    }
    // If there's no content on the navigation stack, make an empty view controller for the detail side
    return [GVEmptyViewController new];
}

@end

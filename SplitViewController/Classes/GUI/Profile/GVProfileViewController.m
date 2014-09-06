//
//  GVProfileViewController.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVProfileViewController.h"
#import "GVProfileView.h"
#import "GVUser.h"

@interface GVProfileViewController ()

@property (nonatomic, strong) GVProfileView *profileView;

@end
@implementation GVProfileViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Profile";
        
        [self.view addSubview:self.profileView];
        [self setupContraints];
        self.profileView.topLayoutGuide = self.topLayoutGuide;
        self.profileView.collection = self.traitCollection;
    }
    return self;
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.profileView.collection = newCollection;
        [self.view setNeedsLayout];
    } completion:nil];
}

#pragma mark - Setter method 

- (void)setUser:(GVUser *)user {
    if ([_user isEqual: user]) {
        return;
    }
    _user = user;
    self.profileView.user = _user;
}

#pragma mark - Property

- (GVProfileView *)profileView {
    if (!_profileView) {
        _profileView = [[GVProfileView alloc] initWithFrame:CGRectZero];
        _profileView.backgroundColor = [UIColor whiteColor];
        _profileView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _profileView;
}

#pragma mark - Private methods

- (void)setupContraints {
    id profileView = self.profileView;
    NSDictionary *views = NSDictionaryOfVariableBindings(profileView);
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[profileView]|"
                                                                   options:0 metrics:nil views:views];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[profileView]|"
                                                          options:0 metrics:nil views:views];
    [self.view addConstraints:constraints];

}
@end

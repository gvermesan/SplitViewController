//
//  GVPhotoViewController.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVPhotoViewController.h"
#import "GVPhotoView.h"
#import "GVPhoto.h"

@interface GVPhotoViewController ()

@property (nonatomic, strong) GVPhotoView *photoView;

@end

@implementation GVPhotoViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.photoView];
        [self setupContraints];
    }
    return self;
}

#pragma mark - Property

- (void)setPhoto:(GVPhoto *)photo {
    if ([_photo isEqual:photo]) {
        return;
    }
    _photo = photo;
    self.photoView.photo = _photo;
}

- (GVPhotoView *)photoView {
    if (!_photo) {
        _photoView = [[GVPhotoView alloc] initWithFrame:CGRectZero];
        _photoView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _photoView;
}

#pragma mark - Private methods

- (void)setupContraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_photoView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_photoView]|"
                                                                   options:0 metrics:nil
                                                                     views:views];
    [self.view addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_photoView]|"
                                                          options:0 metrics:nil
                                                            views:views];
    [self.view addConstraints:constraints];
}

@end

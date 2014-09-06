//
//  GVPhotoView.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVPhotoView.h"
#import "GVControl.h"
#import "GVPhoto.h"
#import "GVDescriptionView.h"

@interface GVPhotoView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) GVControl *ratingControl;
@property (nonatomic, strong) GVDescriptionView *descriptionView;

@end
@implementation GVPhotoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.descriptionView];
        [self addSubview:self.ratingControl];
        [self addLayoutsContraints];

    }
    return self;
}

#pragma mark - Property

- (void)setPhoto:(GVPhoto *)photo {
    if ([_photo isEqual:photo]) {
        return;
    }
    _photo = photo;
    self.imageView.image = [UIImage imageNamed:_photo.imageName];
    self.descriptionView.photo = _photo;
    self.ratingControl.ratingStar = [_photo.rating integerValue];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imageView;
}

- (GVControl *)ratingControl {
    if (!_ratingControl) {
        _ratingControl = [[GVControl alloc] initWithFrame:CGRectZero];
        _ratingControl.backgroundColor = [UIColor clearColor];
        _ratingControl.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _ratingControl;
}

- (GVDescriptionView *)descriptionView {
    if (!_descriptionView) {
        _descriptionView = [[GVDescriptionView alloc] initWithFrame:CGRectZero];
        _descriptionView.backgroundColor = [UIColor clearColor];
        _descriptionView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _descriptionView;
}

#pragma mark - Layouts constraints

- (void)addLayoutsContraints {
    NSDictionary *views = NSDictionaryOfVariableBindings(_imageView, _descriptionView, _ratingControl);
    [self addHorizontalConstraintsWithFormat:@"H:|[_imageView]|" forViews:views];
    [self addVerticalConstraintsWithFormat:@"V:|[_imageView]|" forViews:views];
    
    [self addHorizontalConstraintsWithFormat:@"H:[_descriptionView]-|" forViews:views];
    [self addHorizontalConstraintsWithFormat:@"H:[_ratingControl]-|" forViews:views];

    [self addVerticalConstraintsWithFormat:@"V:[_descriptionView]-[_ratingControl]|" forViews:views];
}

- (void)addHorizontalConstraintsWithFormat:(NSString *)format forViews:(NSDictionary *)views {
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:views];
    [self addConstraints:constraints];
    
}

- (void)addVerticalConstraintsWithFormat:(NSString *)format forViews:(NSDictionary *)views {
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:views];
    [self addConstraints:constraints];
    
}

@end

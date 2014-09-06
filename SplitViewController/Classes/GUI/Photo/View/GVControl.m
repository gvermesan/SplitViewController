//
//  GVControl.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVControl.h"

@interface GVControl ()

@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@property (nonatomic, strong) NSMutableArray *imageViews;

@end

@implementation GVControl

const NSUInteger kRatingControlMinimumRating = 0;
const NSUInteger kRatingControlMaximumRating = 4;
static NSString * const kRatingInactiveImageName = @"ratingInactive";
static NSString * const kRatingActiveImageName = @"ratingActive";

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageViews = [NSMutableArray array];
        [self addSubview:self.visualEffectView];
        [self addImageViews];
        
        [self addConstraintsForVisualEffectView];
        [self addConstraintsForImageView];
    }
    return self;
}

#pragma mark - Property

- (void)setRatingStar:(NSUInteger)ratingStar {
    if (_ratingStar == ratingStar) {
        return;
    }
    _ratingStar = ratingStar;
    [self updateImageView];
}

- (UIVisualEffectView *)visualEffectView {
    if (!_visualEffectView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _visualEffectView.contentView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.3];
        _visualEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _visualEffectView;
}

#pragma mark - Layouts Constraints

- (void)addConstraintsForVisualEffectView {
    NSArray *constraints;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_visualEffectView);
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_visualEffectView]|"
                                                          options:0 metrics:nil
                                                            views:views];
    [self addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_visualEffectView]|"
                                                          options:0 metrics:nil
                                                            views:views];
    [self addConstraints:constraints];
    
}

- (void)addConstraintsForImageView {
    UIImageView *lastImageView = nil;
    NSLayoutConstraint *constraint;
    
    for (UIImageView *imageView in self.imageViews) {
        NSDictionary *views = lastImageView ?
        NSDictionaryOfVariableBindings(lastImageView, imageView) : NSDictionaryOfVariableBindings(imageView);
        
        constraint = [NSLayoutConstraint constraintWithItem:imageView
                                                  attribute:NSLayoutAttributeWidth
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:imageView
                                                  attribute:NSLayoutAttributeHeight
                                                 multiplier:1.f constant:0.f];
        
        [self addVerticalContraintsWithFormat:@"V:|-4-[imageView]-4-|" ForViews:views];
        
        if (lastImageView) {
            [self addHorizontalContraintsWithFormat:@"H:[lastImageView][imageView(==lastImageView)]" ForViews:views];
        } else {
            [self addHorizontalContraintsWithFormat:@"H:|-4-[imageView]" ForViews:views];
        }
        lastImageView = imageView;
    }
    NSDictionary *views = NSDictionaryOfVariableBindings(lastImageView);
    [self addHorizontalContraintsWithFormat:@"H:[lastImageView]-4-|" ForViews:views];
}

- (void)addHorizontalContraintsWithFormat:(NSString *)format ForViews:(NSDictionary *)views {
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:views];
    [self addConstraints:constraints];
}

- (void)addVerticalContraintsWithFormat:(NSString *)format ForViews:(NSDictionary *)views {
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:views];
    [self addConstraints:constraints];
}

#pragma mark - Private methods

- (void)addImageViews {
    for (NSUInteger index = 0; index <= kRatingControlMaximumRating; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.userInteractionEnabled = YES;
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        imageView.image = [UIImage imageNamed:kRatingInactiveImageName];
        imageView.highlightedImage = [UIImage imageNamed:kRatingActiveImageName];
        [self addSubview:imageView];
        [self.imageViews addObject:imageView];
        [self updateImageView];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self updateControlWithTouches:touches andEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self updateControlWithTouches:touches andEvent:event];
}

- (void)updateControlWithTouches:(NSSet *)touches andEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint position = [touch locationInView:self];
    UIView *touchedView = [self hitTest:position withEvent:event];
    
    if ([self.imageViews containsObject:touchedView]) {
        self.ratingStar = [self.imageViews indexOfObject:touchedView];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)updateImageView {
    [self.imageViews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        imageView.highlighted = (idx <= self.ratingStar);
    }];
}

@end

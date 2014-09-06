//
//  GVDescriptionView.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/31/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVDescriptionView.h"
#import "GVPhoto.h"

@interface GVDescriptionView ()
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;

@end

@implementation GVDescriptionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.visualEffectView];
        [self addSubview:self.descriptionLabel];
        
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
    self.descriptionLabel.text = _photo.comment;
}

- (UIVisualEffectView *)visualEffectView {
    if (!_visualEffectView) {
        UIVisualEffect *visualEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:visualEffect];
        _visualEffectView.contentView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.3];
        _visualEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _visualEffectView;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _descriptionLabel.backgroundColor = [UIColor clearColor];
        _descriptionLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        _descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _descriptionLabel;
}

#pragma mark - Trait Collection method

- (CGSize)intrinsicContentSize {
    CGSize labelSize = self.descriptionLabel.intrinsicContentSize;
    
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
        labelSize.width += 4.f;
    } else {
        labelSize.width += 40.f;
    }
    
    if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        labelSize.height += 4.;
    } else {
        labelSize.height += 40.f;
    }
    return labelSize;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (self.traitCollection.horizontalSizeClass != previousTraitCollection.horizontalSizeClass ||
        self.traitCollection.verticalSizeClass != previousTraitCollection.verticalSizeClass) {
        [self invalidateIntrinsicContentSize];
    }
}

#pragma mark - Layputs contraints

- (void)addLayoutsContraints {
    NSArray *constraints;
    NSLayoutConstraint *constraint;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_visualEffectView);
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_visualEffectView]|"
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    [self addConstraints:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_visualEffectView]|"
                                                          options:0
                                                          metrics:nil
                                                            views:views];
    [self addConstraints:constraints];
    
    constraint = [NSLayoutConstraint constraintWithItem:_descriptionLabel
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1.f
                                               constant:0.f];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:_descriptionLabel
                                              attribute:NSLayoutAttributeCenterY
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeCenterY
                                             multiplier:1.f
                                               constant:0.f];
    [self addConstraint:constraint];
}

@end

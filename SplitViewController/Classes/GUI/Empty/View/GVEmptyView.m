//
//  GVEmptyView.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 9/6/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVEmptyView.h"

@interface GVEmptyView ()

@property (nonatomic, strong) UILabel *emptyLabel;

@end

@implementation GVEmptyView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.emptyLabel];
        [self addLayoutConstraints];
    }
    return self;
}

#pragma mark - Property

- (UILabel *)emptyLabel {
    if (!_emptyLabel) {
        _emptyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _emptyLabel.text = @"No Conversation Selected";
        _emptyLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        _emptyLabel.textColor = [UIColor colorWithWhite:0.0 alpha:0.4];
        _emptyLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _emptyLabel;
}

#pragma mark - Layout Contraints

- (void)addLayoutConstraints {
    NSLayoutConstraint *layoutConstraint;
    
    layoutConstraint = [NSLayoutConstraint constraintWithItem:self.emptyLabel
                                                    attribute:NSLayoutAttributeCenterX
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeCenterX
                                                   multiplier:1.f constant:0.f];
    [self addConstraint:layoutConstraint];
    
    layoutConstraint = [NSLayoutConstraint constraintWithItem:self.emptyLabel
                                                    attribute:NSLayoutAttributeCenterY
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeCenterY
                                                   multiplier:1.f constant:0.f];
    [self addConstraint:layoutConstraint];
}

@end

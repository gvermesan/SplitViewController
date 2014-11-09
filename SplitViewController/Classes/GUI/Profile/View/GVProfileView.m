//
//  GVProfileView.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVProfileView.h"
#import "GVLabel.h"
#import "GVUser.h"
#import "GVPhoto.h"
#import "GVConversation.h"

@interface GVProfileView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) GVLabel *nameLabel;
@property (nonatomic, strong) GVLabel *conversationsLabel;
@property (nonatomic, strong) GVLabel *photosLabel;

@property (nonatomic, strong) NSArray *constraints;
@end

@implementation GVProfileView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.conversationsLabel];
        [self addSubview:self.photosLabel];
    }
    return self;
}

#pragma mark - Property

- (void)setUser:(GVUser *)user {
    if ([_user isEqual: user]) {
        return;
    }
    _user = user;
    [self updateProfileView:_user];
}

- (void)setCollection:(UITraitCollection *)collection {
    if ([_collection isEqual:collection]) {
        return;
    }
    _collection = collection;
    [self updateConstraintsForTraitCollection:_collection];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _imageView;
}

- (GVLabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[GVLabel alloc] initWithFontTextStyle:UIFontTextStyleHeadline];
    }
    return _nameLabel;
}

- (GVLabel *)conversationsLabel {
    if (!_conversationsLabel) {
        _conversationsLabel = [[GVLabel alloc] initWithFontTextStyle:UIFontTextStyleBody];
    }
    return _conversationsLabel;
}

- (GVLabel *)photosLabel {
    if (!_photosLabel) {
        _photosLabel = [[GVLabel alloc] initWithFontTextStyle:UIFontTextStyleBody];
    }
    return _photosLabel;
}

#pragma mark - Private methods 

- (void)updateProfileView:(GVUser *)user {
    GVPhoto *photo = user.photo;
    self.imageView.image = [UIImage imageNamed:photo.imageName];
    self.nameLabel.text = user.name;
    
    self.conversationsLabel.text = [NSString stringWithFormat:@"%lud Conversations", [user.conversations count]];
    NSUInteger count = [self updateNumberOfPhotos:user.conversations];
    self.photosLabel.text = [NSString stringWithFormat:@"%ld Photos", count];
}

- (NSUInteger)updateNumberOfPhotos:(NSArray *)conversations {
    NSMutableArray *allPhotos = [NSMutableArray array];
    for (GVConversation *conversation in conversations) {
        for (GVPhoto *photo in conversation.photos) {
            [allPhotos addObject:photo];
        }
    }
    return [allPhotos count];
}
#pragma mark - Layouts contraints

- (void)updateConstraintsForTraitCollection:(UITraitCollection *)collection {
    NSArray *constraints;
    
    if (collection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
      constraints = [self updateConstraintsForCompactInterfaceSizeClass];
    } else {
      constraints =  [self updateConstraintsForReguralInterfaceSizeClass];
    }
    
    if (self.constraints) {
        [self removeConstraints:self.constraints];
    }
    self.constraints = constraints;
    [self addConstraints:self.constraints];
}

- (NSArray *)updateConstraintsForReguralInterfaceSizeClass {
    NSMutableArray *allContraints = [NSMutableArray array];
    NSArray *constraints;
    
    id topLayoutGuide = self.topLayoutGuide;
    id imageView = self.imageView;
    id name = self.nameLabel;
    id conversations = self.conversationsLabel;
    id photos = self.photosLabel;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(topLayoutGuide, imageView, name, conversations, photos);
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[name]-|" options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[conversations]-|" options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[photos]-|" options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-74-[name]-[conversations]-[photos]-20-[imageView]|"
                                                          options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];

    return allContraints;
}

- (NSArray *)updateConstraintsForCompactInterfaceSizeClass {
    NSMutableArray *allContraints = [NSMutableArray array];
    NSArray *constraints;
    
    id topLayoutGuide = self.topLayoutGuide;
    id imageView = self.imageView;
    id name = self.nameLabel;
    id conversations = self.conversationsLabel;
    id photos = self.photosLabel;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(topLayoutGuide, imageView, name, conversations, photos);
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]-[name]|" options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]-[conversations]|" options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]-[photos]|" options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-32-[name]-[conversations]-[photos]"
                                                          options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-32-[imageView]|"
                                                          options:0
                                                          metrics:nil views:views];
    [allContraints addObjectsFromArray:constraints];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:imageView
                                               attribute:NSLayoutAttributeWidth
                                               relatedBy:NSLayoutRelationEqual
                                                  toItem:self
                                               attribute:NSLayoutAttributeWidth
                                              multiplier:0.5
                                                constant:0.f];
    
    [allContraints addObject:constraint];
    
    return allContraints;
}

@end

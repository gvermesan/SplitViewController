//
//  GVLabel.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVLabel.h"

@implementation GVLabel

- (instancetype)initWithFontTextStyle:(NSString *)style {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.font = [UIFont preferredFontForTextStyle:style];
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

@end

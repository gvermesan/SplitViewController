//
//  GVPhoto.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVPhoto.h"
#import "GVUtils.h"

@interface GVPhoto ()

@property (nonatomic, readwrite, copy) NSString *imageName;
@property (nonatomic, readwrite, copy) NSString *comment;
@property (nonatomic, readwrite, strong) NSNumber *rating;

@end

@implementation GVPhoto

+ (instancetype)photoFromDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.imageName = dictionary[kImageName];
        self.comment = dictionary[kComment];
        self.rating = dictionary[kRating];
    }
    return self;
}

@end

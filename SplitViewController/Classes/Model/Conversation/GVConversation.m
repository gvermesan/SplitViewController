//
//  GVConversation.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVConversation.h"
#import "GVUtils.h"
#import "GVPhoto.h"

@interface GVConversation ()

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite, strong) NSArray *photos;

@end

@implementation GVConversation

+ (instancetype)itemForDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[kUserName];
        NSArray *allPhotos = [self photosFromArrray:dictionary[kAllPhotos]];
        self.photos = allPhotos;
    }
    return self;
}

- (NSArray *)photosFromArrray: (NSArray *)photos {
    NSMutableArray *allPhotos = [NSMutableArray array];
    for (NSDictionary *dictionary in photos) {
        GVPhoto *photo = [GVPhoto photoFromDictionary:dictionary];
        [allPhotos addObject:photo];
    }
    return allPhotos;
}

@end

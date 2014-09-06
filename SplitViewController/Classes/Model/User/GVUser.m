//
//  GVUser.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVUser.h"
#import "GVPhoto.h"
#import "GVUtils.h"
#import "GVConversation.h"

@interface GVUser ()

@property (nonatomic, readwrite, copy) NSString *name;
@property (nonatomic, readwrite, strong) NSArray *conversations;
@property (nonatomic, readwrite, strong) GVPhoto *photo;

@end

@implementation GVUser


+ (instancetype)userWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[kUserName];
        NSArray *allConversations = [self loadConversations:dictionary[kConversations]];
        self.conversations = allConversations;
        self.photo = [GVPhoto photoFromDictionary:dictionary[kPhoto]];
    }
    return self;
}

- (NSArray *)loadConversations:(NSArray *)conversations {
    NSMutableArray *allConversations = [NSMutableArray array];
    for (NSDictionary *dictionary in conversations) {
        GVConversation *conversation = [GVConversation itemForDictionary:dictionary];
        [allConversations addObject:conversation];
    }
    return allConversations;
}
@end

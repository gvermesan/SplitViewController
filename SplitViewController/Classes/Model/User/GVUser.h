//
//  GVUser.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

@import Foundation;
@class GVPhoto;

@interface GVUser : NSObject

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;
+ (instancetype)userWithDictionary: (NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, strong) NSArray *conversations;
@property (nonatomic, readonly, strong) GVPhoto *photo;

@end

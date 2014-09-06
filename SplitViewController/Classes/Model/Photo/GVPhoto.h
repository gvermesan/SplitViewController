//
//  GVPhoto.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

@import Foundation;

@interface GVPhoto : NSObject

+ (instancetype)photoFromDictionary: (NSDictionary *)dictionary;
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSString *imageName;
@property (nonatomic, readonly, copy) NSString *comment;
@property (nonatomic, readonly, strong) NSNumber *rating;

@end

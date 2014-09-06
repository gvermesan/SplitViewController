//
//  GVConversation.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GVConversation : NSObject

+ (instancetype)itemForDictionary: (NSDictionary *)dictionary;
- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, strong) NSArray *photos;
@end

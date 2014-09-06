//
//  GVManager.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface GVManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) UIViewController *rootViewController;

@end

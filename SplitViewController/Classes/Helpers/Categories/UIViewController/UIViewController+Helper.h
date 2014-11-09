//
//  UIViewController+Helper.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 11/9/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GVPhoto;

@interface UIViewController (Helper)

- (GVPhoto *)photoForViewController;
- (BOOL)isPhotoContained:(GVPhoto *)photo;

@end

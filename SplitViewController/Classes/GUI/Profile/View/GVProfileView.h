//
//  GVProfileView.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

@import UIKit;
@class GVUser;

@interface GVProfileView : UIView

@property (nonatomic, copy) UITraitCollection *collection;
@property (nonatomic, weak) id <UILayoutSupport> topLayoutGuide;
@property (nonatomic, strong) GVUser *user;

@end

//
//  GVConversationViewController.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/31/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "BaseTableViewController.h"
@class GVConversation;

@interface GVConversationViewController : BaseTableViewController

@property (nonatomic, strong) GVConversation *conversation;

@end

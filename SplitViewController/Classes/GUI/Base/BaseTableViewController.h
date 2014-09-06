//
//  ViewController.h
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

- (Class)tableViewCellClass;
- (void)configereCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

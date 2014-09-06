//
//  ViewController.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/29/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()
@property (nonatomic, copy) NSString *cellIdentifier;

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellIdentifier = NSStringFromClass([self class]);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:self.tableViewCellClass forCellReuseIdentifier:self.cellIdentifier];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_tableView);
    NSArray *contraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil views:views];
    [self.view addConstraints:contraints];
    
    contraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil views:views];
    [self.view addConstraints:contraints];
}

- (Class)tableViewCellClass {
    return [UITableViewCell class];
}

- (void)configereCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    return;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        cell = [[self.tableViewCellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    [self configereCell:cell atIndexPath:indexPath];
    return cell;
}

@end

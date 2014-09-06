//
//  GVConversationViewController.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/31/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "GVConversationViewController.h"
#import "GVConversation.h"
#import "GVPhoto.h"
#import "GVPhotoViewController.h"

@interface GVConversationViewController ()

@end

@implementation GVConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger count = [self.conversation.photos count];
    return count;
}

#pragma mark - Overwritten methods

- (void)configereCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GVPhoto *photo = self.conversation.photos[indexPath.row];
    cell.textLabel.text = photo.comment;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GVPhoto *photo = self.conversation.photos[indexPath.row];
    NSString *title = [self navigationTitleForIndexPath:indexPath];
    GVPhotoViewController *photoVC = [GVPhotoViewController new];
    photoVC.title = title;
    photoVC.photo = photo;
    [self showDetailViewController:photoVC sender:self];
}

#pragma mark - Private method

- (NSString *)navigationTitleForIndexPath:(NSIndexPath *)indexPath {
    NSString *title;
    title = [NSString stringWithFormat:@"%d of %d", indexPath.row + 1, [self.conversation.photos count]];
    return title;
}

@end

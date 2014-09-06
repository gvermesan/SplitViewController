//
//  MenuViewController.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "MenuViewController.h"
#import "GVUser.h"
#import "GVConversation.h"
#import "GVPhoto.h"
#import "GVProfileViewController.h"
#import "GVPhotoViewController.h"
#import "GVConversationViewController.h"

@interface MenuViewController ()
@property (nonatomic, strong) NSArray *conversations;
@property (nonatomic, strong) GVUser *myUser;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Conversations";
    
    self.conversations = [NSArray array];
    [self loadItemsFromPList];
    
    [self addFrofileNavBarButton];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.conversations count];
}

#pragma mark - Overwritten methods

- (void)configereCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    GVConversation *conversation = self.conversations[indexPath.row];
    cell.textLabel.text = conversation.name;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GVConversation *conversation = self.conversations[indexPath.row];
    NSArray *photos = conversation.photos;
    if ([photos count] > 1) {
        
        GVConversationViewController *conversationVC = [GVConversationViewController new];
        conversationVC.conversation = conversation;
        conversationVC.title = conversation.name;
        [self showViewController:conversationVC sender:self];
        return;
    }
    
    GVPhoto *photo = [photos firstObject];
    
    GVPhotoViewController *photoVC = [GVPhotoViewController new];
    photoVC.title = conversation.name;
    photoVC.photo = photo;
    [self showDetailViewController:photoVC sender:self];

}

#pragma mark - Navigation bar button item action

- (void)rightBarButtonIteMPressed:(UIBarButtonItem *)item {
    GVProfileViewController *profileVC = [GVProfileViewController new];
    profileVC.user = self.myUser;
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                        target:self
                                                                                        action:@selector(closeProfile:)];
    profileVC.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:profileVC];
    navController.modalPresentationStyle = UIModalPresentationPopover;
    navController.popoverPresentationController.barButtonItem = item;
    navController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)closeProfile: (UIBarButtonItem *)item {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private methods

- (void)loadItemsFromPList {
    NSString *rootPath = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    NSDictionary *items = [NSDictionary dictionaryWithContentsOfFile:rootPath];
    GVUser *user = [GVUser userWithDictionary:items];
    self.conversations = user.conversations;
    self.myUser = user;
}

- (void)addFrofileNavBarButton {
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Profile" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonIteMPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}


@end

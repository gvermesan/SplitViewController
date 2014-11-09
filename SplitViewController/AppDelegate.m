//
//  AppDelegate.m
//  SplitViewController
//
//  Created by Gabriel Vermesan on 8/28/14.
//  Copyright (c) 2014 Gabriel Vermesan. All rights reserved.
//

#import "AppDelegate.h"
#import "GVManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    self.window.rootViewController = [[GVManager sharedInstance] rootViewController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end

//
//  AppDelegate.m
//  OKNetVideoPlayer
//
//  Created by 王朋 on 2019/12/29.
//  Copyright © 2019 smithgoo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FrontPageViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window.rootViewController =[[UINavigationController alloc] initWithRootViewController:[FrontPageViewController new]];
    return YES;
}


 
@end

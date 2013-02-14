//
//  UIPickerViewSampleAppDelegate.m
//  UIPickerViewSample
//
//  Created by 세라 유 on 11. 2. 6..
//  Copyright 2011 아이티에스. All rights reserved.
//

#import "UIPickerViewSampleAppDelegate.h"
#import "RootViewController.h"

@implementation UIPickerViewSampleAppDelegate

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	CGRect frame = [[UIScreen mainScreen] bounds];
	window_ = [[UIWindow alloc] initWithFrame:frame];
	
	RootViewController* rootViewController = [[[RootViewController alloc] init] autorelease];
	navi_ = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	
	[window_ addSubview:navi_.view];
	[window_ makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navi_ release];
	[window_ release];
    [super dealloc];
}


@end

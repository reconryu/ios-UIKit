//
//  iPadUINavationControllerSampleAppDelegate.m
//  iPadUINavationControllerSample
//
//  Created by 세라 유 on 11. 2. 5..
//  Copyright 2011 아이티에스. All rights reserved.
//

#import "iPadUINavationControllerSampleAppDelegate.h"
#import "TopMenuController.h"

@implementation iPadUINavationControllerSampleAppDelegate

@synthesize window_;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	// window를 스스로 작성
	CGRect bounds = [[UIScreen mainScreen] bounds];
	window_ = [[UIWindow alloc] initWithFrame:bounds];

	// 기점이 되는 Controller를 작성
	TopMenuController* topMenu = [[[TopMenuController alloc] init] autorelease];  
	rootController_ = [[UINavigationController alloc] initWithRootViewController:topMenu];
	
	// window에 Controller의 view를 추가
	[window_ addSubview:rootController_.view];
	
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
	[rootController_ release];
	[window_ release];
    [super dealloc];
}


@end

//
//  iPadHelloWorldAppDelegate.m
//  iPadHelloWorld
//
//  Created by 세라 유 on 11. 2. 5..
//  Copyright 2011 아이티에스. All rights reserved.
//

#import "iPadHelloWorldAppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"

@implementation iPadHelloWorldAppDelegate

@synthesize window_;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // window 구하기
	CGRect bounds = [[UIScreen mainScreen] bounds];
	window_ = [[UIWindow alloc] initWithFrame:bounds];
	
	// ViewController1과 ViewController2를 작성해서
	// 그 view를 각각 윈도우에 추가
	viewController1_ = [[ViewController1 alloc] init];
	viewController2_ = [[ViewController2 alloc] init];
	[window_ addSubview:viewController1_.view];
	[window_ addSubview:viewController2_.view];
	
	// ViewController1이 view의 앞으로 나오도록 함
	[window_ bringSubviewToFront:viewController1_.view];
	
	// Override point for customization after application launch.
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
	[viewController1_ release];
	[viewController2_ release];
    [window_ release];
    [super dealloc];
}


@end

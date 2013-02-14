//
//  UITabBarControllerSampleAppDelegate.m
//  UITabBarControllerSample
//
//  Created by 세라 유 on 11. 2. 5..
//  Copyright 2011 아이티에스. All rights reserved.
//

#import "UITabBarControllerSampleAppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"

@implementation UITabBarControllerSampleAppDelegate

@synthesize window_;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	// window 구하기
	CGRect bounds = [[UIScreen mainScreen] bounds];
	window_ = [[UIWindow alloc] initWithFrame:bounds];
	
	// 기점이 되는 Controller를 작성
	rootController_ = [[UITabBarController alloc] init];
	
	// ViewController1과 ViewController2를 작성한다.
	ViewController1* tab1 = [[[ViewController1 alloc] init] autorelease];
	ViewController2* tab2 = [[[ViewController2 alloc] init] autorelease];
	
	// 작성한 ViewController를 Controller에 모두 추가
	NSArray* controllers = [NSArray arrayWithObjects:tab1, tab2, nil];
	[(UITabBarController*)rootController_ setViewControllers:controllers animated:NO];
	
	// window_에 Controller의 view를 추가
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

//
//  iPadHelloWorld2AppDelegate.m
//  iPadHelloWorld2
//
//  Created by 세라 유 on 11. 2. 5..
//  Copyright 2011 아이티에스. All rights reserved.
//

#import "iPadHelloWorld2AppDelegate.h"

@implementation iPadHelloWorld2AppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // window 구하기
	CGRect bounds = [[UIScreen mainScreen] bounds];
	window = [[UIWindow alloc] initWithFrame:bounds];
	
	// 어플리케이션 윈도우와 같은 크기의 사각형을 구함
	CGRect rect = [window frame];	
	// UILabel 인스턴스를 만들고 초기화 한다
	// 앞에서 구한 사각형과 같은 위치와 같은 크기의 UILabel이 생성된다
	UILabel* label = [[UILabel alloc] initWithFrame:rect];
	// UILabel에 표시할 메세지는 물론「Hello, world!」
	label.text = @"Hello, world!";
	// 만든 UILabel을 window에 추가하자.
	[window addSubview:label];
	// 마지막에 release를 잊지 않도록 주의한다！
	[label release];    
	
	// Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
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
    [window release];
    [super dealloc];
}


@end

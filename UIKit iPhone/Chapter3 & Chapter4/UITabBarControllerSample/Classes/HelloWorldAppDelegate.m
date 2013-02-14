//
//  HelloWorldAppDelegate.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "HelloWorldAppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"

@implementation HelloWorldAppDelegate

@synthesize window_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
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
}

- (void)dealloc {
  [rootController_ release];
  [window_ release];
  [super dealloc];
}

@end

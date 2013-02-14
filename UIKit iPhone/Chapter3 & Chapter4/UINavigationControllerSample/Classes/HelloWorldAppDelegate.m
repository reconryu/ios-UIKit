//
//  HelloWorldAppDelegate.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "HelloWorldAppDelegate.h"
#import "TopMenuController.h"

@implementation HelloWorldAppDelegate

@synthesize window_;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  
  // window를 스스로 작성
  CGRect bounds = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:bounds];

  // 기점이 되는 Controller를 작성
  TopMenuController* topMenu = [[[TopMenuController alloc] init] autorelease];  
  rootController_ = [[UINavigationController alloc] initWithRootViewController:topMenu];
  
  // window에 Controller의 view를 추가
  [window_ addSubview:rootController_.view];

  [window_ makeKeyAndVisible];
}

- (void)dealloc {
  [rootController_ release];
  [window_ release];
  [super dealloc];
}

@end

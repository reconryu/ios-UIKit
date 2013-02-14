//
//  ApplicationAndDeviceSampleAppDelegate.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "ApplicationAndDeviceSampleAppDelegate.h"
#import "RootViewController.h"

@implementation ApplicationAndDeviceSampleAppDelegate 

- (void)dealloc {
  [navi_ release];
  [window_ release];
  [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

  CGRect frame = [[UIScreen mainScreen] bounds];
  window_ = [[UIWindow alloc] initWithFrame:frame];

  RootViewController* rootViewController = [[[RootViewController alloc] init] autorelease];
  navi_ = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  [navi_ setNavigationBarHidden:YES animated:NO];

  [window_ addSubview:navi_.view];
  [window_ makeKeyAndVisible];
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url {
  NSString* query = [url query];
  if ( !url || !query ) return NO;
  // 인수를 그대로 알람표시
  // 실제로는 이 인수에 의해서 여러가지로 처리를 변경한다
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = query;
  [alert addButtonWithTitle:@"OK"];
  [alert show];
  return YES;
}

@end

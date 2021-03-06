//
//  UIImagePickerControllerSampleAppDelegate.m
//
//  Created by ToKoRo on 2009-10-11.
//

#import "UIImagePickerControllerSampleAppDelegate.h"
#import "RootViewController.h"

@implementation UIImagePickerControllerSampleAppDelegate

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

  [window_ addSubview:navi_.view];
  [window_ makeKeyAndVisible];
}

@end

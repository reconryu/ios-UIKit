//
//  SampleForAlertDismiss.m
//
//  Created by ToKoRo on 2009-09-19.
//

#import "SampleForAlertDismiss.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForAlertDismiss ()
- (void)dismissAlert:(UIAlertView*)alert;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForAlertDismiss

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = @"이 메세지는 3초 후에 사라집니다.";
  [alert addButtonWithTitle:@"취소"];
  alert.cancelButtonIndex = 0;
  [alert show];

  [self performSelector:@selector(dismissAlert:) withObject:alert afterDelay:3.0];
}

- (void)dismissAlert:(UIAlertView*)alert {
  if ( alert.visible ) {
    [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
  } 
}

@end

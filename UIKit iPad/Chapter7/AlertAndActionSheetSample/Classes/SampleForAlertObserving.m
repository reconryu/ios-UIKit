//
//  SampleForAlertObserving.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForAlertObserving.h"

@implementation SampleForAlertObserving

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.delegate = self;
  alert.message = @"delegate메소드 실험 중입니다...";
  [alert addButtonWithTitle:@"Cancel"];
  [alert addButtonWithTitle:@"OK"];
  alert.cancelButtonIndex = 0;
  [alert show];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex != alertView.cancelButtonIndex ) {
    NSLog( @"pushed OK button." );
  } else {
    NSLog( @"pushed Cancel button." );
  }
}

- (void)willPresentAlertView:(UIAlertView*)alertView {
  NSLog( @"willPresentAlertView" );
}

- (void)didPresentAlertView:(UIAlertView*)alertView {
  NSLog( @"didPresentAlertView" );
}

- (void)alertView:(UIAlertView*)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
  NSLog( @"willDismissWithButtonIndex:%d", buttonIndex );
}

- (void)alertView:(UIAlertView*)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
  NSLog( @"didDismissWithButtonIndex:%d", buttonIndex );
}

- (void)alertViewCancel:(UIAlertView*)alertView {
  NSLog( @"alertViewCancel" );
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return TRUE;
}

@end

//
//  SampleForAlert.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForAlert.h"

@implementation SampleForAlert

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.title = @"유감스러운 소식";
  alert.message = @"당신의 저장 데이터가 사라져 버렸습니다";
  [alert addButtonWithTitle:@"OK"];
  [alert show];

  /* initWithTitle을 사용해도 OK
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"유감스러운 소식"
                                                   message:@"당신의 저장 데이터가 사라져 버렸습니다"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
  */

}

@end

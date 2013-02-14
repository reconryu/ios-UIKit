//
//  SampleForDoubleTouch.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForDoubleTouch.h"

@implementation SampleForDoubleTouch

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // 멀티탭을 허용할 경우에 이것을 설정
  self.view.multipleTouchEnabled = YES;
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  NSString* message = [NSString stringWithFormat:@"%d개의 손가락이 동시에 터치됨", [touches count]];
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end

//
//  SampleForButtonTap.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForButtonTap.h"

@implementation SampleForButtonTap

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"위험!만지지마!" forState:UIControlStateNormal];
  [button sizeToFit];
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  button.center = self.view.center;
  button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:button];
}

- (void)buttonDidPush {
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = @"쾅!!";
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end

//
//  SampleForShowsTouch.m
//
//  Created by ToKoRo on 2009-09-27.
//

#import "SampleForShowsTouch.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForShowsTouch ()
- (UIButton*)buttonForThisSample;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForShowsTouch

- (void)viewDidLoad {
  [super viewDidLoad];
  UIButton* button1 = [self buttonForThisSample];
  button1.frame = CGRectMake( 0, 0, 200, 60 );
  button1.center = self.view.center;
  button1.showsTouchWhenHighlighted = YES;
  [self.view addSubview:button1];

  UIButton* button2 = [self buttonForThisSample];
  button2.frame = button1.frame;
  CGPoint newPoint = button1.center;
  newPoint.y += 100;
  button2.center = newPoint;
  [self.view addSubview:button2];
}

#pragma mark ----- Private Methods -----

- (UIButton*)buttonForThisSample {
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  button.titleLabel.font = [UIFont boldSystemFontOfSize:24];

  [button setTitle:@"UIButton" forState:UIControlStateNormal];
  return button;
}

@end

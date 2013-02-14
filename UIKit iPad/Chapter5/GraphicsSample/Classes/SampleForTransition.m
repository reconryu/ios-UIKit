//
//  SampleForTransition.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForTransition.h"

static const NSInteger kTagViewForTransitionTest = 1;

#pragma mark ----- Private Methods Definition -----

@interface SampleForTransition ()
- (UIView*)nextView;
- (void)animationDidStop;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForTransition

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view addSubview:[self nextView]];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( ![UIView areAnimationsEnabled] ) {
    [self.nextResponder touchesEnded:touches withEvent:event];
    return;
  } 
  static UIViewAnimationTransition transition = UIViewAnimationTransitionFlipFromLeft;

  UIView* nextView = [self nextView];
  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDelegate:self];
  [UIView setAnimationDidStopSelector:@selector(animationDidStop)];
  [UIView setAnimationDuration:2.0];
  [UIView setAnimationTransition:transition forView:self.view cache:YES];
  [[self.view viewWithTag:kTagViewForTransitionTest] removeFromSuperview];
  [self.view addSubview:nextView];
  [UIView commitAnimations];
  [UIView setAnimationsEnabled:NO];

  if ( UIViewAnimationTransitionCurlDown < ++transition ) {
    transition = UIViewAnimationTransitionFlipFromLeft;
  } 
}

#pragma mark ----- Private Methods -----

- (UIView*)nextView {
  static BOOL isFront = YES;
  UIImage* image;
  if ( isFront ) {
    image = [UIImage imageNamed:@"dog.jpg"]; //< 겉 이미지
  } else {
    image = [UIImage imageNamed:@"town.jpg"]; //< 안 이미지
  }
  isFront = ( YES != isFront );
  UIView* view = [[[UIImageView alloc] initWithImage:image] autorelease];
  view.tag = kTagViewForTransitionTest;
  view.frame = self.view.bounds;
  view.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  view.contentMode = UIViewContentModeScaleAspectFill;
  return view;
}

- (void)animationDidStop {
  [UIView setAnimationsEnabled:YES];
}

@end

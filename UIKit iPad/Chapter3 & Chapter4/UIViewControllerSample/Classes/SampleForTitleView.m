//
//  SampleForTitleView.m
//
//  Created by ToKoRo on 2009-08-29.
//

#import "SampleForTitleView.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForTitleView ()
- (void)sliderDidChange;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForTitleView

// finalize
- (void)dealloc {
  [slider_ release];
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.navigationItem.prompt = @"슬라이드를 움직이면 화면의 색이 바뀝니다.";

  slider_ = [[UISlider alloc] init];
  slider_.frame = self.navigationController.navigationBar.bounds;
  slider_.minimumValue = 0.0;
  slider_.maximumValue = 1.0;
  slider_.value = slider_.maximumValue / 2.0;
  [slider_ addTarget:self
             action:@selector(sliderDidChange)
   forControlEvents:UIControlEventValueChanged];
  self.navigationItem.titleView = slider_;

  label_ = [[UILabel alloc] init];
  label_.frame = CGRectInset( self.view.bounds, 10, 10 );
  label_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label_];

  [self sliderDidChange];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
  [self.navigationItem setHidesBackButton:YES animated:NO];
}

#pragma mark ----- Private Methods -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationItem setHidesBackButton:NO animated:YES];
}

- (void)sliderDidChange {
  UIColor* color = [[[UIColor alloc] initWithRed:slider_.value
                                           green:slider_.value
                                            blue:slider_.value
                                           alpha:1.0 ] autorelease];
  label_.backgroundColor = color;
}

@end

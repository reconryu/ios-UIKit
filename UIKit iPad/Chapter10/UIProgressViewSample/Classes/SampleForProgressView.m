//
//  SampleForProgressView.m
//
//  Created by ToKoRo on 2009-10-04.
//

#import "SampleForProgressView.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForProgressView ()
- (void)updateProgress:(UIProgressView*)progressView;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForProgressView

- (void)dealloc {
  [progressView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  progressView_ =
    [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
  progressView_.center = self.view.center;
  progressView_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                                   UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:progressView_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self updateProgress:progressView_];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  progressView_.hidden = YES;
}

- (void)updateProgress:(UIProgressView*)progressView {
  if ( [progressView isHidden] || 1.0 <= progressView.progress ) {
    return;
  } 
  progressView.progress += 0.1;
  [self performSelector:@selector(updateProgress:)
             withObject:progressView
             afterDelay:1.0];
}

@end

//
//  SampleForRotateAndAutoresizing.m
//
//  Created by ToKoRo on 2009-08-27.
//

#import "SampleForRotateAndAutoresizing.h"

@implementation SampleForRotateAndAutoresizing

- (void)dealloc {
  [imageView_ release]; 
  [super dealloc];
}

#pragma mark ----- Override Methods -----

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Rotate";
  self.view.backgroundColor = [UIColor blackColor];

  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.contentMode = UIViewContentModeScaleAspectFill;
  imageView_.clipsToBounds = YES;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;  

  [self.view addSubview:imageView_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];

  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:YES];

  imageView_.frame = CGRectInset( self.view.bounds, 20, 20 );
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

@end

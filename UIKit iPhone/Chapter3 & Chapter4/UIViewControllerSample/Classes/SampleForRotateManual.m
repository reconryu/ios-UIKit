//
//  SampleForRotateManual.m
//
//  Created by ToKoRo on 2009-08-27.
//

#import "SampleForRotateManual.h"

@implementation SampleForRotateManual

- (void)dealloc {
  [imageView1_ release]; 
  [imageView2_ release]; 
  [super dealloc];
}

#pragma mark ----- Override Methods -----

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Rotate";
  self.view.backgroundColor = [UIColor blackColor];

  UIImage* image1 = [UIImage imageNamed:@"town.jpg"];
  imageView1_ = [[UIImageView alloc] initWithImage:image1];
  imageView1_.contentMode = UIViewContentModeScaleAspectFill;
  imageView1_.clipsToBounds = YES;
  imageView1_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
                                  | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
                                  | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;  
  CGSize frameSize = self.view.frame.size;
  imageView1_.frame = CGRectMake( 0, 0, frameSize.width, frameSize.height / 2 );
  [self.view addSubview:imageView1_];

  UIImage* image2 = [UIImage imageNamed:@"dog.jpg"];
  imageView2_ = [[UIImageView alloc] initWithImage:image2];
  imageView2_.contentMode = UIViewContentModeScaleAspectFill;
  imageView2_.clipsToBounds = YES;
  imageView2_.autoresizingMask = imageView1_.autoresizingMask;
  imageView2_.frame = CGRectMake( 0, frameSize.height / 2, frameSize.width, frameSize.height / 2 );
  [self.view addSubview:imageView2_];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
  duration:(NSTimeInterval)duration
{
  NSLog( @"willRotateToInterfaceOrientation" );
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
  duration:(NSTimeInterval)duration
{
  NSLog( @"willAnimateRotationToInterfaceOrientation" );

  CGSize frameSize = self.view.frame.size;
  switch ( interfaceOrientation ) {
    case UIInterfaceOrientationPortrait:
    case UIInterfaceOrientationPortraitUpsideDown:
      imageView1_.frame = CGRectMake( 0, 0, frameSize.width, frameSize.height / 2 );
      imageView2_.frame = CGRectMake( 0, frameSize.height / 2, frameSize.width, frameSize.height / 2 );
      break;
    default:
      imageView1_.frame = CGRectMake( 0, 0, frameSize.width / 2, frameSize.height );
      imageView2_.frame = CGRectMake( frameSize.width / 2, 0, frameSize.width / 2, frameSize.height );
      break;
  }
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  NSLog( @"didRotateFromInterfaceOrientation" );
}

@end

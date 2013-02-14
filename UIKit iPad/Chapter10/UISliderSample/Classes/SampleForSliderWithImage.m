//
//  SampleForSliderWithImage.m
//
//  Created by ToKoRo on 2009-10-02.
//

#import "SampleForSliderWithImage.h"

@implementation SampleForSliderWithImage

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.text = @"성";
  label_.font = [UIFont boldSystemFontOfSize:48];
  label_.textAlignment = UITextAlignmentCenter;
  [self.view addSubview:label_];

  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 250, 50 );
  slider.minimumValue = 0.0;
  slider.maximumValue = 1.0;
  slider.value = 0.5; //< 초기값 설정
  slider.center = self.view.center;

  UIImage* imageForMin = [UIImage imageNamed:@"roope_small.png"];
  UIImage* imageForMax = [UIImage imageNamed:@"roope_big.png"];
  slider.minimumValueImage = imageForMin;
  slider.maximumValueImage = imageForMax;

  [self.view addSubview:slider];

  [slider addTarget:self
             action:@selector(sliderDidChange:)
   forControlEvents:UIControlEventValueChanged];
}

- (void)sliderDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISlider class]] ) {
    UISlider* slider = sender;
    label_.font = [UIFont boldSystemFontOfSize:( 96 * slider.value )];
  } 
}

@end

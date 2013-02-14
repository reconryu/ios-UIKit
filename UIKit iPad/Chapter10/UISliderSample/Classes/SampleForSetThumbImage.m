//
//  SampleForSetThumbImage.m
//
//  Created by ToKoRo on 2009-10-02.
//

#import "SampleForSetThumbImage.h"

@implementation SampleForSetThumbImage

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 250, 50 );
  slider.minimumValue = 0.0;
  slider.maximumValue = 1.0;
  slider.value = 0.5; //< 초기값 설정
  slider.center = self.view.center;

  UIImage* imageForThumb = [UIImage imageNamed:@"thumb.png"];
  UIImage* imageMinBase = [UIImage imageNamed:@"left.png"];
  UIImage* imageForMin = [imageMinBase stretchableImageWithLeftCapWidth:4 topCapHeight:0];
  UIImage* imageMaxBase = [UIImage imageNamed:@"right.png"];
  UIImage* imageForMax = [imageMaxBase stretchableImageWithLeftCapWidth:4 topCapHeight:0];
  [slider setThumbImage:imageForThumb forState:UIControlStateNormal];
  [slider setThumbImage:imageForThumb forState:UIControlStateHighlighted];
  [slider setMinimumTrackImage:imageForMin forState:UIControlStateNormal];
  [slider setMaximumTrackImage:imageForMax forState:UIControlStateNormal];

  [self.view addSubview:slider];
}

@end

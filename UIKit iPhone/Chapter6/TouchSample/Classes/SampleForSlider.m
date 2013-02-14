//
//  SampleForSlider.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForSlider.h"

@implementation SampleForSlider

// finalize
- (void)dealloc {
  [sliderCopy_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UISlider";
  self.view.backgroundColor = [UIColor whiteColor];

  // 슬라이더를 생성
  UISlider* slider = [[[UISlider alloc] init] autorelease];
  slider.frame = CGRectMake( 0, 0, 200, 50 );
  slider.minimumValue = 0.0; //< 슬라이더의 최소값을 설정
  slider.maximumValue = 1.0; //< 슬라이더의 최대값을 설정
  slider.center = self.view.center;

  // 슬라이더가 변경되었을 때의 호출할 메소드를 지정한다.
  [slider addTarget:self
             action:@selector(sliderDidChange:)
   forControlEvents:UIControlEventValueChanged];

  // 슬라이더를 복사한다.
  sliderCopy_ = [[UISlider alloc] init];
  sliderCopy_.frame = slider.frame;
  sliderCopy_.minimumValue = slider.minimumValue;
  sliderCopy_.maximumValue = slider.maximumValue;
  CGPoint point = slider.center;
  point.y += 50;
  sliderCopy_.center = point;

  // 슬라이더를 2개 화면에 추가
  [self.view addSubview:slider];
  [self.view addSubview:sliderCopy_];
}

// 슬라이더가 변경되었을 때 여기가 호출된다.
- (void)sliderDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISlider class]] ) {
    UISlider* slider = sender;
    // sliderCopy_의 값을 slider와 같게 설정
    sliderCopy_.value = slider.value;
  } 
}

@end

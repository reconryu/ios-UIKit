//
//  SampleForImageWithCap.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForImageWithCap.h"

@implementation SampleForImageWithCap

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // 빨간원형의 이미지를 읽기
  UIImage* image = [UIImage imageNamed:@"circle.png"];
  // 캡 이미지 작성
  UIImage* imageWithCap = [image stretchableImageWithLeftCapWidth:30 topCapHeight:30];
  
  // 캡하지 않은 이미지를 배경에으로 한 버튼을 화면에 추가한다.
  UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
  [button setBackgroundImage:image forState:UIControlStateNormal];
  [button setTitle:@"가로가 긴 UIButton 캡【없음】판" forState:UIControlStateNormal];
  [button sizeToFit];
  button.center = CGPointMake( 160, 50 );
  [self.view addSubview:button];

  // 캡 이미지를 배경으로 한 버튼을 화면에 추가한다.
  UIButton* buttonWithCap = [UIButton buttonWithType:UIButtonTypeCustom];
  [buttonWithCap setBackgroundImage:imageWithCap forState:UIControlStateNormal];
  [buttonWithCap setTitle:@"가로가 긴 UIButton 캡【있음】판" forState:UIControlStateNormal];
  [buttonWithCap sizeToFit];
  buttonWithCap.center = CGPointMake( 160, 150 );
  [self.view addSubview:buttonWithCap];
}

@end

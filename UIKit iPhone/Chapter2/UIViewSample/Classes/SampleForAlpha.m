//
//  SampleForAlpha.m
//
//  Created by ToKoRo on 2009-08-08.
//

#import "SampleForAlpha.h"

@implementation SampleForAlpha

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 배경을 흰색으로
  self.view.backgroundColor = [UIColor whiteColor];

  // 화면 상부에 라벨을 추가
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
  label_.textAlignment = UITextAlignmentCenter;
  label_.backgroundColor = [UIColor redColor];
  label_.textColor = [UIColor whiteColor];
  label_.adjustsFontSizeToFitWidth = YES;
  label_.text = @"빨간 배경에 흰 글씨";

  [self.view addSubview:label_];

  // 색을 변경할 버튼을 추가
  UIButton* alphaButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  alphaButton.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 70;
  alphaButton.center = newPoint;
  [alphaButton setTitle:@"투명화" forState:UIControlStateNormal];
  [alphaButton addTarget:self
                action:@selector(alphaDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:alphaButton];
}

- (void)alphaDidPush {
  // 라벨의 알파값을 0.1씩 줄인다
  // 이미 0.0이라면 1.0로 되돌린다
  if ( label_.alpha < 0.09 ) {
    label_.alpha = 1.0;
  } else {
    label_.alpha -= 0.1; 
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

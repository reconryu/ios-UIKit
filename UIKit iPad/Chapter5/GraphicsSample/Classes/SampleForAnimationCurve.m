//
//  SampleForAnimationCurve.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationCurve.h"

@implementation SampleForAnimationCurve

- (void)dealloc {
  [star_ release];
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  // UIImageView의 작성/초기화
  UIImage* image = [UIImage imageNamed:@"star.png"];
  star_ = [[UIImageView alloc] initWithImage:image];
  star_.center = CGPointMake( self.view.center.x, -100 );
  [self.view addSubview:star_];
  // 알파의 작성/초기화
  label_ = [[UILabel alloc] init];
  label_.frame = CGRectMake( 0, self.view.bounds.size.height - 20, 320, 20 );
  label_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"UIViewAnimationCurveEaseInOut";
  [self.view addSubview:label_];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  static UIViewAnimationCurve animationCurve = UIViewAnimationCurveEaseInOut;

  star_.center = CGPointMake( self.view.center.x, -100 ); //< 그림이 처음 있는 위치
  star_.alpha = 1.0; //< 시작 시의 알파값

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationCurve:animationCurve]; //< 애니메이션 커브의 설정
  [UIView setAnimationDuration:2.0]; //< １회 애니메이션을 2.0초로 설정
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 그림 이동이 종료될 위치
  star_.alpha = 0.0; //< 종료 시의 알파값
  [UIView commitAnimations];

  // 라벨에 현재 애니메이션 커브를 표시
  switch ( animationCurve ) {
    case UIViewAnimationCurveEaseInOut:
      label_.text = @"UIViewAnimationCurveEaseInOut";
      break;
    case UIViewAnimationCurveEaseIn:
      label_.text = @"UIViewAnimationCurveEaseIn";
      break;
    case UIViewAnimationCurveEaseOut:
      label_.text = @"UIViewAnimationCurveEaseOut";
      break;
    case UIViewAnimationCurveLinear:
      label_.text = @"UIViewAnimationCurveLinear";
      break;
    default:
      label_.text = @"-";
      break;
  }

  // 애니메이션 커브의 변경
  if ( UIViewAnimationCurveLinear < ++animationCurve ) {
    animationCurve = UIViewAnimationCurveEaseInOut;
  } 
}

@end

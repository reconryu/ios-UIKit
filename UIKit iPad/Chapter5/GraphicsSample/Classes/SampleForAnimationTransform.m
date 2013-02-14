//
//  SampleForAnimationTransform.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationTransform.h"

@implementation SampleForAnimationTransform

- (void)dealloc {
  [star_ release];
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
}


#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  star_.center = CGPointMake( self.view.center.x, -100 ); //< 그림이 처음 있는 위치
  star_.alpha = 1.0; //< 시작 시의 알파값
  star_.transform = CGAffineTransformIdentity; //< transform을 초기화

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationRepeatAutoreverses:YES]; //< 반전 설정
  [UIView setAnimationDuration:2.0]; //< 1회 애니메이션을 2.0초로 설정
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 그림 이동이 종료될 위치
  star_.alpha = 0.0; //< 종료 시의 알파값

  // 다음은 확대와 회전의 혼합
  CGAffineTransform transformScale = CGAffineTransformScale( CGAffineTransformIdentity, 5, 5 );
  CGAffineTransform transformRotate = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI );
  star_.transform = CGAffineTransformConcat( transformScale, transformRotate );
  [UIView commitAnimations];
}

@end

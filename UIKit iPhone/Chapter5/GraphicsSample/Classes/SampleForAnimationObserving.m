//
//  SampleForAnimationObserving.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationObserving.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForAnimationObserving ()
- (void)startAnimation;
- (void)animationDidStop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForAnimationObserving

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

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self startAnimation]; //< 화면 표시와 동시에 애니메이션을 시작한다.
}

#pragma mark ----- Private Methods -----

- (void)startAnimation {

  star_.center = CGPointMake( self.view.center.x, -100 ); //< 그림의 처음있는 위치
  star_.transform = CGAffineTransformIdentity; //< transform을 초기화

  [UIView beginAnimations:nil context:NULL];
  [UIView setAnimationDelegate:self]; //< 델리게이트를 자기 자신으로 설정
  [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
  [UIView setAnimationDuration:2.0]; //< １회 애니메이션을 2.0초로 설정한다
  [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
  star_.center = CGPointMake( self.view.center.x, 300 ); //< 그림 이동이 종료될 위치
  CGAffineTransform transformScale = CGAffineTransformScale( CGAffineTransformIdentity, 5, 5 );
  CGAffineTransform transformRotate = CGAffineTransformRotate( CGAffineTransformIdentity, M_PI );
  star_.transform = CGAffineTransformConcat( transformScale, transformRotate );
  [UIView commitAnimations];
}

- (void)animationDidStop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context {
  // 애니메이션을 취소하지 않고 완료했다면, 한 번 더 애니메니션을 시작한다.
  if ( [finished boolValue] ) {
    [self startAnimation];
  } 
}

@end

//
//  SampleForAnimationMove.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForAnimationMove.h"

@implementation SampleForAnimationMove

- (void)dealloc {
  [star_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UIImage* image = [UIImage imageNamed:@"star.png"];
  star_ = [[UIImageView alloc] initWithImage:image];
  star_.center = CGPointMake( -100, -100 );
  [self.view addSubview:star_];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  star_.center = CGPointMake( -100, -100 ); //< 그림이 처음 있는 위치

  [UIView beginAnimations:nil context:NULL]; //< 애니메이션 블록의 시작
  [UIView setAnimationDuration:1.0]; //< １회 애니메이션을 1.0초로 설정한다.
  star_.center = CGPointMake( 420, 400 ); //< 그림 이동이 종료될 위치
  [UIView commitAnimations]; //< 애니메이션 블록의 종료
}

@end

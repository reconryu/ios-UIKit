//
//  SampleForDoubleSlide.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForDoubleSlide.h"

@implementation SampleForDoubleSlide

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  self.view.multipleTouchEnabled = YES;
  // 라벨 추가
  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"２개 손가락으로 슬라이드하여 상하로 움직입니다";
  [self.view addSubview:label_];
}

#pragma mark ----- Responder -----

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( 2 == [touches count] ) {
    // ２개 손가락으로 터치하는 경우, 각각의 세로 방향의 이동 거리를 구함
    NSInteger distance[2];
    int i = 0;
    for ( UITouch* touch in touches ) {
      CGPoint before = [touch previousLocationInView:self.view];
      CGPoint now = [touch locationInView:self.view];
      distance[i] = now.y - before.y;
      ++i;
    }
    CGPoint newPoint = label_.center;
    if ( 0 < distance[0] && 0 < distance[1] ) {
      // 양쪽 모두 아래로 움직이고 있다면 라벨도 아래로 움직인다.
      newPoint.y += MAX( distance[0], distance[1] );
    } else if ( 0 > distance[0] && 0 > distance[1] ) {
      // 양쪽 모두 위로 움직이고 있다면 라벨도 위로 움직인다.
	  newPoint.y += MAX( distance[0], distance[1] );
    } 
    label_.center = newPoint;
  } 
}

@end

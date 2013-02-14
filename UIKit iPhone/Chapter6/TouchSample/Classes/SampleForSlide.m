//
//  SampleForSlide.m
//
//  Created by ToKoRo on 2009-09-02.
//

#import "SampleForSlide.h"

@implementation SampleForSlide

- (void)dealloc {
  [label_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor blackColor];
  // 라벨 추가
  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.backgroundColor = [UIColor whiteColor];
  label_.textAlignment = UITextAlignmentCenter;
  label_.text = @"상하좌우로 슬라이드 할 수 있습니다.";
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label_];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(suspend)
                                               name:UIApplicationWillResignActiveNotification
                                             object:nil];
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 터치한 위치를 보존
  touchBegan_ = [[touches anyObject] locationInView:self.view];
  // 라벨의 원래 위치를 보존
  labelOrigin_ = label_.center;
  // 움직일 방향을 초기화
  direction_ = kSlideNone;
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  static const NSInteger kNeedMove = 10;
  CGPoint point = [[touches anyObject] locationInView:self.view];
  // 처음 터치한 위치와 현재 위치의 차를 구함
  NSInteger distanceHorizontal = point.x - touchBegan_.x;
  NSInteger distanceVertical = point.y - touchBegan_.y;

  if ( kSlideNone == direction_ ) {
    // 움직일 방향을 결정
    if ( ABS( distanceHorizontal ) > ABS( distanceVertical )  ) {
      // 가로 방향으로 움직인다.
      if ( kNeedMove <= ABS( distanceHorizontal ) ) {
        direction_ = kSlideHorizontal;
      } 
    } else {
      // 세로 방향으로 움직인다.
      if ( kNeedMove <= ABS( distanceVertical ) ) {
        direction_ = kSlideVertical;
      } 
    }
  }
  if ( kSlideNone != direction_ ) {
    // 움직일 거리 설정
    CGPoint newPoint = labelOrigin_;
    if ( kSlideHorizontal == direction_ ) {
      newPoint.x += distanceHorizontal;
    } else {
      newPoint.y += distanceVertical;
    }
    // 이동 적용
    label_.center = newPoint;
  }
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  // 손을 떼면 라벨이 원래 위치로 돌아온다
  [UIView beginAnimations:nil context:nil];
  label_.center = self.view.center;
  [UIView commitAnimations];
}

- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
  [self touchesEnded:touches withEvent:event];
}

- (void)suspend {
  [self touchesCancelled:nil withEvent:nil];
}

@end

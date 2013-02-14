//
//  SampleForFlick.m
//
//  Created by ToKoRo on 2009-09-02.
//

#import "SampleForFlick.h"

@implementation SampleForFlick

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark ----- Responder -----

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 터치한 시간과 위치를 보존
  UITouch* touch = [touches anyObject];
  timestampBegan_ = event.timestamp;
  pointBegan_ = [touch locationInView:self.view];
}


- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  static const NSTimeInterval kFlickJudgeTimeInterval = 0.3;
  static const NSInteger kFlickMinimumDistance = 10;
  UITouch* touchEnded = [touches anyObject];
  CGPoint pointEnded = [touchEnded locationInView:self.view];
  NSInteger distanceHorizontal = ABS( pointEnded.x - pointBegan_.x );
  NSInteger distanceVertical = ABS( pointEnded.y - pointBegan_.y );
  if ( kFlickMinimumDistance > distanceHorizontal && kFlickMinimumDistance > distanceVertical ) {
    // 세로로도 가로로도 별로 이동하지 않았으면 return
    return;
  } 
  NSTimeInterval timeBeganToEnded = event.timestamp - timestampBegan_;
  if ( kFlickJudgeTimeInterval > timeBeganToEnded ) {
    // 플릭 취급
    NSString* message;
    // 어느쪽 방향에 플릭했는지를 판정
    if ( distanceHorizontal > distanceVertical ) {
      if ( pointEnded.x > pointBegan_.x ) {
        message = @"오른쪽 플릭 검출！";
      } else {
        message = @"왼쪽 플릭 검출！";
      }
    } else {
      if ( pointEnded.y > pointBegan_.y ) {
        message = @"아래 플릭 검출！";
      } else {
        message = @"위 플릭 검출！";
      }
    }
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"OK", nil] autorelease];
    [alert show];
  } 
}

@end

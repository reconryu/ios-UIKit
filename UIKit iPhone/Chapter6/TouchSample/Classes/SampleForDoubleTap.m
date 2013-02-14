//
//  SampleForDoubleTap.m
//
//  Created by ToKoRo on 2009-09-01.
//

#import "SampleForDoubleTap.h"

@implementation SampleForDoubleTap

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  // 화면이 터치되면 싱글탭 플래그를 해제
  singleTapReady_ = NO;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  NSInteger tapCount = [[touches anyObject] tapCount];
  if ( 2 > tapCount ) {
    // tapCount가 2보다 작으면 싱글탭 플래그를 YES로
    singleTapReady_ = YES;
    // 거기에 singleTap 확정 메소드를 0.3초 후에 지연 실행
    [self performSelector:@selector(singleTap)
               withObject:nil
               afterDelay:0.3f];
  } else {
    // dabouleTap 확정 메소드를 실행
    [self performSelector:@selector(doubleTap)];
  }

}

- (void)singleTap {
  // 이것이 호출될 때까지 다른 touchesBegan이 호출되면 취소
  if ( !singleTapReady_ ) return;

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"Single Tap!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

- (void)doubleTap {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"Double Tap!!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end

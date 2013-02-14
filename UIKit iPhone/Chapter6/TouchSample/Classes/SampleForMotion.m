//
//  SampleForMotion.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForMotion.h"

// UILabel 서브클래스 구현
@implementation LabelForMotion

- (BOOL)canBecomeFirstResponder {
  return YES;
}

@end

 
// UIViewController 서브클래스 구현
@implementation SampleForMotion

- (void)viewDidLoad {
  [super viewDidLoad];
  // 새롭게 만든 라벨 붙이기
  LabelForMotion* label = [[[LabelForMotion alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"Shake me!";
  [self.view addSubview:label];
  // 라벨을 퍼스트 레스폰더로 설정하는 것을 잊지 않도록 	
  [label becomeFirstResponder];
}

// 쉐이크 모션이 완료하면 이 메소드가 불린다
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent*)event {
  NSLog( @"motionBegan" );
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event {
  NSLog( @"motionEnded" );
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"지진--이다！！"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent*)event {
  NSLog( @"motionCancelled" );
}

@end

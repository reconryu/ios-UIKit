//
//  SampleForObserving.m
//
//  Created by ToKoRo on 2009-08-12.
//

#import "SampleForObserving.h"

@implementation SampleForObserving

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* message = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 100 )] autorelease];
  message.numberOfLines = 3;
  message.text = @"이 샘플은 감시 메소드가 호출되는 것을 로그로 확인하기 위한 것입니다.";
  [self.view addSubview:message];

  NewLabel* label = [[[NewLabel alloc] initWithFrame:CGRectZero] autorelease];
  UILabel* dummy = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];

  NSLog( @"[self.view addSubview:label]" );
  [self.view addSubview:label];

  NSLog( @"[label addSubview:dummy]" );
  [label addSubview:dummy];

  NSLog( @"[dummy removeFromSuperview]" );
  [dummy removeFromSuperview];

  NSLog( @"[self.view addSubview:dummy]" );
  [self.view addSubview:dummy];

  NSLog( @"[self.view exchangeSubviewAtIndex]" );
  [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];

  NSLog( @"[label removeFromSuperview]" );
  [label removeFromSuperview];

  // UIWindow

  UIApplication* app = [UIApplication sharedApplication];
  UIWindow* window = (UIWindow*)[app.windows objectAtIndex:0];
  NSLog( @"[window addSubview:label]" );
  [window addSubview:label];

  NSLog( @"[label removeFromSuperview]" );
  [label removeFromSuperview];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

@implementation NewLabel

- (void)didAddSubview:(UIView*)subview {
  NSLog( @"didAddSubview" );
}

- (void)didMoveToSuperview {
  NSLog( @"didMoveToSuperview" );
}

- (void)didMoveToWindow {
  NSLog( @"didMoveToWindow" );
}

- (void)willMoveToSuperview:(UIView*)newSuperview {
  NSLog( @"willMoveToSuperview" );
}

- (void)willMoveToWindow:(UIWindow*)newWindow {
  NSLog( @"willMoveToWindow" );
}

- (void)willRemoveSubview:(UIView*)subview {
  NSLog( @"willRemoveSubview" );
}

@end

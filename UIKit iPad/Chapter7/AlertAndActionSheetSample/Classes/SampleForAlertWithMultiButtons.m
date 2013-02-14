//
//  SampleForAlertWithMultiButtons.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForAlertWithMultiButtons.h"

@implementation SampleForAlertWithMultiButtons

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.delegate = self;
  alert.title = @"저장 데이터 복구";
  alert.message = @"당신의 저장 데이터가 사라져 버렸습니다. 전에 저장한 곳으로 돌아가겠습니까?";
  [alert addButtonWithTitle:@"아니오"];
  [alert addButtonWithTitle:@"네"];
  alert.cancelButtonIndex = 0;
  [alert show];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
  // 눌린 버튼이 캔슬버튼인지 아닌지를 판정한다
  if ( buttonIndex != alertView.cancelButtonIndex ) {
	// [네]가 눌렸을 때의 처리  
    UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
    alert.title = @"복구 실패";
    alert.message = @"유감스럽지만 복구를 실패했습니다";
    [alert addButtonWithTitle:@"OK"];
    [alert show];
  } 
}

@end




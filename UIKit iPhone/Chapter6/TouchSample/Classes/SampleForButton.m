//
//  SampleForButton.m
//
//  Created by ToKoRo on 2009-08-30.
//

#import "SampleForButton.h"

@implementation SampleForButton

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UIButton";
  self.view.backgroundColor = [UIColor whiteColor];

  // 버튼 작성
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  // 버튼 캡션을 설정
  [button setTitle:@"Touch me!" forState:UIControlStateNormal];
  // 캡션에 맞춰 크기를 자동 조절
  [button sizeToFit];
  // 화면의 한 가운데로 이동
  button.center = self.view.center;
  // 화면이 바뀐 경우 버튼의 위치를 자동 조절
  button.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                            UIViewAutoresizingFlexibleHeight |
                            UIViewAutoresizingFlexibleLeftMargin |
                            UIViewAutoresizingFlexibleRightMargin |
                            UIViewAutoresizingFlexibleTopMargin |
                            UIViewAutoresizingFlexibleBottomMargin;

  // 버튼을 탭한 경우 지정 메소드를 호출
  [button addTarget:self
             action:@selector(buttonDidPush:)
   forControlEvents:UIControlEventTouchUpInside];

  // 버튼을 화면에 추가
  [self.view addSubview:button];
}

// 버튼 탭 시에 이것이 호출된다.
- (void)buttonDidPush:(id)sender {
  if ( [sender isKindOfClass:[UIButton class]] ) {
    UIButton* button = sender;
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                     //message:@"Hello!"
                                                     message:button.currentTitle
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"OK", nil] autorelease];
    [alert show];
  } 
}

@end

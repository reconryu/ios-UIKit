//
//  SampleForTouchesBegan.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForTouchesBegan.h"

@implementation SampleForTouchesBegan

- (void)viewDidLoad {
  [super viewDidLoad];

  // 배경색에 색을 첨가하는 것이 필수
  // 기본이라면 투명이라 탭할 수 없다.
  self.view.backgroundColor = [UIColor whiteColor];
}

// 이것이 터치 이벤트를 받기 위한 메소드
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end

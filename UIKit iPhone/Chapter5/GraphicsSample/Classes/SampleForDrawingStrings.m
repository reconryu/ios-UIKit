//
//  SampleForDrawingStrings.m
//
//  Created by ToKoRo on 2009-09-08.
//

#import "SampleForDrawingStrings.h"

@implementation DrawStrings

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"UIKit용으로 추가된 NSString의 인스턴스 메소드를 사용해 문자열을 출력해 보자.";
  UIFont* systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  [message drawAtPoint:CGPointMake( 0, 0 ) withFont:systemFont];
}

@end

@implementation SampleForDrawingStrings

- (void)viewDidLoad {
  [super viewDidLoad];

  // 새롭게 만든 View를 화면과 같은 크기로 붙이기
  DrawStrings* strings = [[[DrawStrings alloc] init] autorelease];
  strings.frame = self.view.bounds;
  strings.backgroundColor = [UIColor whiteColor];
  strings.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:strings];
}

@end

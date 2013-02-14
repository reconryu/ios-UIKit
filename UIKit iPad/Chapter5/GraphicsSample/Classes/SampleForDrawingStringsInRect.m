//
//  SampleForDrawingStringsInRect.m
//
//  Created by ToKoRo on 2009-09-09.
//

#import "SampleForDrawingStringsInRect.h"
#import "SampleForDrawingStrings.h"

@implementation DrawStringsInRect

- (void)drawRect:(CGRect)rect {
  NSString* message =
    @"UIKit용으로 추가된 NSString의 인스턴스 메소드를 사용해 문자열을 출력해 보자. iPad는 문자열을 길게 해야 한다. 아주 아주 길게 하지 않으면";
  UIFont* systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
  [message drawInRect:rect withFont:systemFont];
}

@end

@implementation SampleForDrawingStringsInRect

- (void)viewDidLoad {
  [super viewDidLoad];

  // 새롭게 만든 View를 화면과 같은 크기로 붙이기
  DrawStringsInRect* strings = [[[DrawStringsInRect alloc] init] autorelease];
  strings.frame = self.view.bounds;
  strings.backgroundColor = [UIColor whiteColor];
  strings.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:strings];
}

@end

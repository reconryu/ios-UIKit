//
//  SampleForTextView.m
//
//  Created by ToKoRo on 2009-09-19.
//

#import "SampleForTextView.h"

@implementation SampleForTextView

- (void)viewDidLoad {
  [super viewDidLoad];

  UITextView* textView = [[[UITextView alloc] init] autorelease];
  textView.frame = self.view.bounds;
  textView.autoresizingMask =
  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView.editable = NO; //< 편집불가로 한다

  textView.backgroundColor = [UIColor blackColor]; //< 배경을 검정으로
  textView.textColor = [UIColor whiteColor]; //< 문자색을 흰색으로
  textView.font = [UIFont systemFontOfSize:32]; //< 폰트 설정
  textView.text = @"Hello, UITextView!\n"
                   "2번째\n"
                   "3번째\n"
                   "4번째\n"
                   "5번째\n"
                   "6번째\n"
                   "7번째\n"
                   "8번째\n"
                   "9번째\n"
                   "10번째\n"
                   "11번째\n"
                   "12번째\n";

  [self.view addSubview:textView];
}

@end

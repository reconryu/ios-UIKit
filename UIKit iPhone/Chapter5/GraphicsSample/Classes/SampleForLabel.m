//
//  SampleForLabel.m
//
//  Created by ToKoRo on 2009-09-08.
//

#import "SampleForLabel.h"

@implementation SampleForLabel

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  // 라벨의 크기를 화면과 같도록
  label.frame = self.view.bounds;
  // 내비게이션 바가 추가되어도 화면과 라벨의 균형을 유지한다.
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"또 다시 라벨의 등장입니다.";
  [self.view addSubview:label];
}

@end

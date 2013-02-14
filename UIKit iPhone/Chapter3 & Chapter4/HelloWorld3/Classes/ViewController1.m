//
//  ViewController1.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController1.h"

@implementation ViewController1

- (void)viewDidLoad {
  [super viewDidLoad];

  // Hello, world! 라벨을 추가
  // 배경은 흰색, 문자는 검정색
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"Hello, world!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor whiteColor];
  label.textColor = [UIColor blackColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];
	
  // 버튼을 추가
  // 이 버튼을 탭하면 화면 전환이 된다.
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"화면 전환" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)buttonDidPush {
  // 자신을 뒤쪽으로 이동
  // 결과적으로 뒤에 있는 ViewController2가 앞으로 나오게 된다.
  [self.view.window sendSubviewToBack:self.view];
}

@end

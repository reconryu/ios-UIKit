//
//  ViewController2.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController2.h"

/* 여기에서는 UITabBarController 관련의 여분의 코드를 남긴 채로 한다 */
/* 이것은 원고 진행상의 이유로 이렇게 한다 */

@implementation ViewController2

// initialize
- (id)init {
  if ( (self = [super init]) ) {
    // tabBar용 설정
    self.title = @"안녕";
    UIImage* icon = [UIImage imageNamed:@"ball2.png"];
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTitle:@"안녕" image:icon tag:0] autorelease];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 안녕, 세계의 뒷편에 라벨을 추가
  // 배경색은 검정, 문자색은 흰색으로
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"안녕, 세계!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];
}

@end

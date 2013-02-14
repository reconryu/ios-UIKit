//
//  ViewController1.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController1.h"


/* 여기에서는 UITabBarController 관련의 여분의 코드를 남긴 채로 한다 */
/* 이것은 원고 진행상의 이유로 이렇게 한다 */

@implementation ViewController1

// initialize
- (id)init {
  if ( (self = [super init]) ) {
    // tabBar용 설정
    self.title = @"Hello";
    UIImage* icon = [UIImage imageNamed:@"ball1.png"];
    self.tabBarItem =
      [[[UITabBarItem alloc] initWithTitle:@"Hello" image:icon tag:0] autorelease];
  }
  return self;
}

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
}

@end

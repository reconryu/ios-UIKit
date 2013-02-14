//
//  ViewController2.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "ViewController2.h"

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

  // Hello, world! 라벨을 추가
  // 배경은 흰색, 문자는 검정으로
  UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.text = @"안녕, 세계!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:label];
}

@end

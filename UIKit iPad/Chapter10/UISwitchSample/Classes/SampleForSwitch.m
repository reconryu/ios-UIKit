//
//  SampleForSwitch.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForSwitch.h"

@implementation SampleForSwitch

- (void)dealloc {
  [switch1_ release];
  [switch2_ release];
  [super dealloc];
}

// switch1_, switch2_를 UISwitch*형의 인스턴스 변수로 한다
- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  // UISwitch 작성과 초기화
  switch1_ = [[UISwitch alloc] init];
  switch1_.center = CGPointMake( 100, 50 );
  // 디폴트 선택을 ON로 한다	
  switch1_.on = YES;
  // 스위치가 변경되었을 때 	switchDidChange메소드가 호출되도록 등록한다
  [switch1_ addTarget:self
               action:@selector(switchDidChange)
     forControlEvents:UIControlEventValueChanged];
  [self.view addSubview:switch1_];
  // UISwitch인스턴스를 하나 더 작성한다
  switch2_ = [[UISwitch alloc] init];
  switch2_.center = CGPointMake( 100, 100 );
  // 디폴트 선택을 NO로 한다	
  switch2_.on = NO;
  [self.view addSubview:switch2_];
}

- (void)switchDidChange {
  // switch1_이 변경되었을 때 switch2_도 함께 변경되도록 한다	 
  [switch2_ setOn:!switch2_.on animated:YES];
}

@end

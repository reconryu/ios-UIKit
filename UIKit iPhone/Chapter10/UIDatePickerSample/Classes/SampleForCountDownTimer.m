//
//  SampleForCountDownTimer.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForCountDownTimer.h"

@implementation SampleForCountDownTimer

- (void)dealloc {
  [timer_ release];
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // 카운트다운 타이머 작성과 초기화
  datePicker_ = [[UIDatePicker alloc] init];
  datePicker_.datePickerMode = UIDatePickerModeCountDownTimer;
  // 초기 표시를 5 min 로 한다
  datePicker_.countDownDuration = 60*5;
  [self.view addSubview:datePicker_];
  // 1초 마다 반복해서 불리는 타이머를 작성 
  timer_ = [[NSTimer timerWithTimeInterval:60.0
                                   target:self
                                 selector:@selector(timerFireMethod:)
                                 userInfo:nil
                                  repeats:YES] retain];
  // 타이머를 시작한다
  NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
  [runLoop addTimer:timer_ forMode:NSDefaultRunLoopMode];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  // 화면이 비표시될 때 반드시 타이머를 중지한다
  if ( [timer_ isValid] ) {
    [timer_ invalidate];
  } 
}

- (void)timerFireMethod:(NSTimer*)theTimer {
  // 타이머가 1초 경과할 때마다 불린다
  // 카운트가 0.0이 될 때까지１분 마다 감산해 나간다
  NSTimeInterval now = datePicker_.countDownDuration;
  if ( 0.0 < now ) {
    datePicker_.countDownDuration = now - 60.0;
  } 
}

@end

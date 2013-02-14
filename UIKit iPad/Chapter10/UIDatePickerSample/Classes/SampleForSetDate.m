//
//  SampleForSetDate.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForSetDate.h"

@implementation SampleForSetDate

- (void)dealloc {
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  datePicker_ = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
  datePicker_.date = [NSDate dateWithTimeIntervalSinceNow:-1*60*60*24*1];
  [self.view addSubview:datePicker_];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"오늘로 돌아가기" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  [button addTarget:self
                  action:@selector(buttonDidPush)
        forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)buttonDidPush {
  [datePicker_ setDate:[NSDate date]]; 
}

@end

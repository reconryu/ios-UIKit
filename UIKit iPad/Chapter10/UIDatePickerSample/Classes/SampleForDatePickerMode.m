//
//  SampleForDatePickerMode.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForDatePickerMode.h"

@implementation SampleForDatePickerMode

- (void)dealloc {
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  datePicker_ = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
  [self.view addSubview:datePicker_];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"모드전환" forState:UIControlStateNormal];
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
  if ( UIDatePickerModeCountDownTimer < ++datePicker_.datePickerMode ) {
    datePicker_.datePickerMode = UIDatePickerModeTime;
  } 
}

@end

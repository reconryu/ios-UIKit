//
//  SampleForMinuteInterval.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForMinuteInterval.h"

@implementation SampleForMinuteInterval

- (void)viewDidLoad {
  [super viewDidLoad];

  UIDatePicker* datePicker = [[[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 320, 216)] autorelease];
  datePicker.minuteInterval = 30;
  datePicker.minimumDate = [NSDate date];
  datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:60*60*24*31];
  [self.view addSubview:datePicker];
}

@end

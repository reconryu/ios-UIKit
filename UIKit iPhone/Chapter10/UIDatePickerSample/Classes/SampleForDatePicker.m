//
//  SampleForDatePicker.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForDatePicker.h"

@implementation SampleForDatePicker

- (void)dealloc {
  [datePicker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  datePicker_ = [[UIDatePicker alloc] init];
  [self.view addSubview:datePicker_];

  [datePicker_ addTarget:self
                  action:@selector(pickerDidChange:)
        forControlEvents:UIControlEventValueChanged];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"일자표시" forState:UIControlStateNormal];
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
  NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
  [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
  NSString* dateString = [formatter stringFromDate:datePicker_.date];
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = dateString;
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

- (void)pickerDidChange:(id)sender {
  if ( [sender isKindOfClass:[UIDatePicker class]] ) {
    UIDatePicker* picker = sender;
    NSLog( @"%@", [picker.date description] );
  } 
}

@end

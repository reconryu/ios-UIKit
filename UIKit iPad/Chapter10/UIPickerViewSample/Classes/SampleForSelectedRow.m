//
//  SampleForSelectedRow.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForSelectedRow.h"

@implementation SampleForSelectedRow

- (void)dealloc {
  [picker_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  picker_ = [[UIPickerView alloc] initWithFrame:CGRectMake(0,0,320,216)];
  picker_.delegate = self;
  picker_.showsSelectionIndicator = YES;
  [self.view addSubview:picker_];

  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"정보표시" forState:UIControlStateNormal];
  [button sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 50;
  button.center = newPoint;
  [button addTarget:self
             action:@selector(buttonDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 3;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 10;
}

- (NSString*)pickerView:(UIPickerView*)pickerView
  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return [NSString stringWithFormat:@"%d", row];
}

- (void)buttonDidPush {
  NSInteger component0 = [picker_ selectedRowInComponent:0];
  NSInteger component1 = [picker_ selectedRowInComponent:1];
  NSInteger component2 = [picker_ selectedRowInComponent:2];
  NSString* message = [NSString stringWithFormat:@"%d - %d - %d", component0, component1, component2];
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = message;
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end

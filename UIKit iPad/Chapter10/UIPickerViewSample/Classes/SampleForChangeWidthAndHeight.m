//
//  SampleForChangeWidthAndHeight.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForChangeWidthAndHeight.h"

@implementation SampleForChangeWidthAndHeight

- (void)viewDidLoad {
  [super viewDidLoad];
  
	UIPickerView* picker = [[[UIPickerView alloc] initWithFrame:CGRectMake(0,0,320,216)] autorelease];
  picker.delegate = self;
  [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 2;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 10;
}

- (NSString*)pickerView:(UIPickerView*)pickerView
  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  if ( 0 == component ) {
    // 1번째
    return [NSString stringWithFormat:@"%2d", row+1];
  } else {
    // 2번째
    return [NSString stringWithFormat:@"약간 긴 문자열 그 %d", row+1];
  }
}


- (CGFloat)pickerView:(UIPickerView*)pickerView widthForComponent:(NSInteger)component {
  if ( 0 == component ) {
    // 1번째 세로폭을 좁게
    return 50;
  } else {
    // 2번째 세로폭을 넓게
    return 250;
  }
}

- (CGFloat)pickerView:(UIPickerView*)pickerView rowHeightForComponent:(NSInteger)component {
  if ( 0 == component ) {
    // 1번째 행의 세로폭을 좁게
    return 30;
  } else {
 //  2번째 행의 세로폭을 넓게
    return 60;
  }
}


@end

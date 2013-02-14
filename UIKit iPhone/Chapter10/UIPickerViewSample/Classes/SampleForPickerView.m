//
//  SampleForPickerView.m
//
//  Created by ToKoRo on 2009-10-03.
//

#import "SampleForPickerView.h"

@implementation SampleForPickerView

- (void)viewDidLoad {
  [super viewDidLoad];
  // UIPickerView를 작성/초기화
  UIPickerView* picker = [[[UIPickerView alloc] init] autorelease];
  picker.delegate = self;     //< delegate에 자기자신을 등록
  picker.dataSource = self;   //< dataSource에 자기자신을 등록
  [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 3;   // 행수는 3줄
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 10;  // 각 줄의 행수는 10행
}

- (NSString*)pickerView:(UIPickerView*)pickerView
  titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  // 각 항목에 행수와 줄수를 표시한다	
  return [NSString stringWithFormat:@"%d-%d", row, component];
}

@end

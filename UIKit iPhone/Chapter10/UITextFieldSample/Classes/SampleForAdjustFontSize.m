//
//  SampleForAdjustFontSize.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForAdjustFontSize.h"

@implementation SampleForAdjustFontSize

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];
  textField1.delegate = self;
  textField1.frame = CGRectMake( 20, 50, 280, 50 );
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.text = @"폰트 사이즈 조정";
  textField1.adjustsFontSizeToFitWidth = YES;
  textField1.font = [UIFont systemFontOfSize:48];
  textField1.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  [self.view addSubview:textField1];
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  if ( [textField canResignFirstResponder] ) {
    [textField resignFirstResponder];
  } 
  return YES;
}

@end

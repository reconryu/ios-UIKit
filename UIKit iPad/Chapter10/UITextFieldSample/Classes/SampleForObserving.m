//
//  SampleForObserving.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForObserving.h"

@implementation SampleForObserving

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];
  textField1.delegate = self;
  textField1.frame = CGRectMake( 20, 50, 280, 40 );
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.text = @"NSLog로 delegate 확인";
  textField1.clearButtonMode = UITextFieldViewModeAlways;
  textField1.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  [self.view addSubview:textField1];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField*)textField {
  NSLog( @"textFieldShouldBeginEditing %@", textField.text );
  return TRUE;
}

- (void)textFieldDidBeginEditing:(UITextField*)textField {
  NSLog( @"textFieldDidBeginEditing %@", textField.text );
}

- (BOOL)textFieldShouldEndEditing:(UITextField*)textField {
  NSLog( @"textFieldShouldEndEditing %@", textField.text );
  return YES;
}

- (void)textFieldDidEndEditing:(UITextField*)textField {
  NSLog( @"textFieldDidEndEditing %@", textField.text );
}

- (BOOL)textField:(UITextField*)textField
  shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString*)string
{
  NSLog( @"shouldChangeCharactersInRange %@", string );
  return YES;
}

- (BOOL)textFieldShouldClear:(UITextField*)textField {
  NSLog( @"textFieldShouldClear %@", textField.text );
  return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField {
  NSLog( @"textFieldShouldReturn %@", textField.text );
  return YES;
}

@end

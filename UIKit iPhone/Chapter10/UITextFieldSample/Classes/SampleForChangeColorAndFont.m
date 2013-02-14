//
//  SampleForChangeColorAndFont.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForChangeColorAndFont.h"

@implementation SampleForChangeColorAndFont

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField = [[[UITextField alloc] init] autorelease];
  textField.frame = CGRectMake( 20, 100, 280, 50 );
  textField.borderStyle = UITextBorderStyleBezel;
  textField.backgroundColor = [UIColor blackColor];  // 배경색 설정
  textField.textColor = [UIColor redColor];          // 폰트색 설정
  textField.textAlignment = UITextAlignmentCenter;
  textField.font = [UIFont systemFontOfSize:36];     // 폰트 설정
  textField.text = @"UITextFields";
  [self.view addSubview:textField];
}

@end

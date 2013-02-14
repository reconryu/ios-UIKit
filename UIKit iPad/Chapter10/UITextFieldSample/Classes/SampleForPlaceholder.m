//
//  SampleForPlaceholder.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForPlaceholder.h"

@implementation SampleForPlaceholder

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UITextField* textField = [[[UITextField alloc] init] autorelease];
  textField.frame = CGRectMake( 20, 100, 280, 30 );
  textField.borderStyle = UITextBorderStyleRoundedRect;
  textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  textField.placeholder = @"메세지를 입력해 주세요.";
  [self.view addSubview:textField];
}

@end

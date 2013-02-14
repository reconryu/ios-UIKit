//
//  SampleForSecureTextEntry.m
//
//  Created by ToKoRo on 2009-09-20.
//

#import "SampleForSecureTextEntry.h"

@implementation SampleForSecureTextEntry

- (void)dealloc {
  [textField_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // UITextField 붙이기
  textField_ = [[UITextField alloc] init];
  textField_.frame = self.view.bounds;
  textField_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textField_.backgroundColor = [UIColor whiteColor];
  textField_.text = @"password";
  textField_.secureTextEntry = YES;
  [self.view addSubview:textField_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [textField_ becomeFirstResponder]; //< 화면 표시 시에 키보드 표시
}

@end

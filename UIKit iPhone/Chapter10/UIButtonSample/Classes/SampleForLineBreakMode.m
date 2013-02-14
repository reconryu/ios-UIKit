//
//  SampleForLineBreakMode.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForLineBreakMode.h"

@implementation SampleForLineBreakMode

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.frame = CGRectMake( 80, 50, 180, 50 );
  [button setTitle:@"긴 문장 실례하겠습니다. 다 들어가지 못하네요." forState:UIControlStateNormal];
  button.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
  [self.view addSubview:button];
}

@end

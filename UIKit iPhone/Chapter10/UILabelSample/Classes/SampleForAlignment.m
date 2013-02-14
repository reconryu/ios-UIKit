//
//  SampleForAlignment.m
//
//  Created by ToKoRo on 2009-08-24.
//

#import "SampleForAlignment.h"

@implementation SampleForAlignment

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UITextAlignment";

  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 10, 320, 30 )] autorelease];
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 50, 320, 30 )] autorelease];
  UILabel* label3 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 90, 320, 30 )] autorelease];

  label1.textAlignment = UITextAlignmentLeft;
  label2.textAlignment = UITextAlignmentCenter;
  label3.textAlignment = UITextAlignmentRight;
  label1.text = @"UITextAlignmentLeft";
  label2.text = @"UITextAlignmentCenter";
  label3.text = @"UITextAlignmentRight";
  [self.view addSubview:label1];
  [self.view addSubview:label2];
  [self.view addSubview:label3];
}

@end

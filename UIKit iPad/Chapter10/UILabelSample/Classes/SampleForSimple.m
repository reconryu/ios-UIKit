//
//  SampleForSimple.m
//
//  Created by ToKoRo on 2009-09-25.
//

#import "SampleForSimple.h"

@implementation SampleForSimple

- (void)viewDidLoad {
  [super viewDidLoad];
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

  label.text = @"HELLO";
  label.textAlignment = UITextAlignmentCenter;

  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];

  label.font = [UIFont fontWithName:@"Zapfino" size:48];

  [self.view addSubview:label];
}

@end

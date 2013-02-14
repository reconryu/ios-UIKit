//
//  SampleForEnabled.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForEnabled.h"

@implementation SampleForEnabled

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  NSArray* items = [NSArray arrayWithObjects:@"Enabled", @"Disabled", @"Enabled", nil];
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  segment.segmentedControlStyle = UISegmentedControlStyleBordered;
  segment.selectedSegmentIndex = 0;
  segment.frame = CGRectMake( 10, 50, 300, 40 );

  [segment setEnabled:NO forSegmentAtIndex:1];

  [self.view addSubview:segment];
}

@end

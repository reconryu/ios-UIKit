//
//  SampleForContentOffset.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForContentOffset.h"

@implementation SampleForContentOffset

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  NSArray* items = [NSArray arrayWithObjects:@"LEVEL1", @"LEVEL2", @"LEVEL3", nil];
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  segment.segmentedControlStyle = UISegmentedControlStyleBar;
  segment.selectedSegmentIndex = 0;
  segment.frame = CGRectMake( 10, 50, 300, 40 );

  [segment setContentOffset:CGSizeMake( 0, -7 ) forSegmentAtIndex:0];
  [segment setContentOffset:CGSizeMake( 0,  7 ) forSegmentAtIndex:2];

  [self.view addSubview:segment];
}

@end

//
//  SampleForSegmentedControlStyle.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForSegmentedControlStyle.h"

@implementation SampleForSegmentedControlStyle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  NSArray* items = [NSArray arrayWithObjects:@"Plain", @"Borderd", @"Bar", nil];
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  segment.segmentedControlStyle = UISegmentedControlStylePlain;
  segment.selectedSegmentIndex = 0;
  segment.frame = CGRectMake( 10, 50, 300, 30 );
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];

  [self.view addSubview:segment];
}

- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    switch ( segment.selectedSegmentIndex ) {
      case 0: segment.segmentedControlStyle =  UISegmentedControlStylePlain; break;
      case 1: segment.segmentedControlStyle =  UISegmentedControlStyleBordered; break;
      default: segment.segmentedControlStyle = UISegmentedControlStyleBar; break;
    }
  } 
}

@end

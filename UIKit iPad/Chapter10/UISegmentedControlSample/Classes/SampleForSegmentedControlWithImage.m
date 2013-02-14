//
//  SampleForSegmentedControlWithImage.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForSegmentedControlWithImage.h"

@implementation SampleForSegmentedControlWithImage

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* image1 = [UIImage imageNamed:@"Elephant.png"];
  UIImage* image2 = [UIImage imageNamed:@"Lion.png"];
  UIImage* image3 = [UIImage imageNamed:@"Dog.png"];
  NSArray* items = [NSArray arrayWithObjects:image1, image2, image3, nil];

  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  segment.segmentedControlStyle = UISegmentedControlStyleBar;
  segment.selectedSegmentIndex = 0;
  segment.frame = CGRectMake( 60, 50, 200, 40 );

  [self.view addSubview:segment];
}

@end

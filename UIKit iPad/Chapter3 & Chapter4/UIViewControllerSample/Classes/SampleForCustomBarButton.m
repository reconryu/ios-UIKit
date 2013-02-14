//
//  SampleForCustomBarButton.m
//
//  Created by ToKoRo on 2009-08-28.
//

#import "SampleForCustomBarButton.h"

@implementation SampleForCustomBarButton

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"CustomBarButton";

  // UIImageView를 내비게이션바에 추가
  UIImage* image = [UIImage imageNamed:@"face.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  UIBarButtonItem* icon =
    [[[UIBarButtonItem alloc] initWithCustomView:imageView] autorelease];
  self.navigationItem.rightBarButtonItem = icon;

  // UISwitch를 툴바에 추가
  UISwitch* theSwitch = [[[UISwitch alloc] init] autorelease];
  theSwitch.on = YES;
  UIBarButtonItem* switchBarButton =
    [[[UIBarButtonItem alloc] initWithCustomView:theSwitch] autorelease];


  // UISegmentedControl를 툴바에 추가
  NSArray* segments = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
  UISegmentedControl* segmentedControl =
    [[[UISegmentedControl alloc] initWithItems:segments] autorelease];
  segmentedControl.selectedSegmentIndex = 1;
  segmentedControl.frame = CGRectMake( 0, 0, 100, 30 );
  UIBarButtonItem* segmentedBarButton =
    [[[UIBarButtonItem alloc] initWithCustomView:segmentedControl] autorelease];

  [self setToolbarItems:[NSArray arrayWithObjects:
          switchBarButton,
          segmentedBarButton,
          nil]];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

@end

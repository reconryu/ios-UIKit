//
//  SampleForInsertAndRemove.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForInsertAndRemove.h"

@implementation SampleForInsertAndRemove

- (void)dealloc {
  [segment_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  segment_ = [[UISegmentedControl alloc] init];
  segment_.segmentedControlStyle = UISegmentedControlStyleBordered;
  segment_.frame = CGRectMake( 10, 50, 300, 30 );
  [self.view addSubview:segment_];

  [segment_ insertSegmentWithTitle:@"3" atIndex:0 animated:NO];
  [segment_ insertSegmentWithTitle:@"2" atIndex:0 animated:NO];
  [segment_ insertSegmentWithTitle:@"1" atIndex:0 animated:NO];

  UIBarButtonItem* insertButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"Insert"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(insertDidPush)] autorelease];
  UIBarButtonItem* removeButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"Remove"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(removeDidPush)] autorelease];
  UIBarButtonItem* removeAllButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"RemoveAll"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(removeAllDidPush)] autorelease];
  NSArray* items = [NSArray arrayWithObjects:insertButton, removeButton, removeAllButton, nil];
  [self setToolbarItems:items animated:YES];
}

- (void)insertDidPush {
  NSNumber* number = [NSNumber numberWithInteger:segment_.numberOfSegments + 1];
  [segment_ insertSegmentWithTitle:[number stringValue]
                           atIndex:[number integerValue]
                          animated:YES];
}

- (void)removeDidPush {
  [segment_ removeSegmentAtIndex:segment_.numberOfSegments - 1 animated:YES];
}

- (void)removeAllDidPush {
  [segment_ removeAllSegments];
}

@end

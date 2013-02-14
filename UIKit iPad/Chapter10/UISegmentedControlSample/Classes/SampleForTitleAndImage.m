//
//  SampleForTitleAndImage.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForTitleAndImage.h"

@implementation SampleForTitleAndImage

- (void)dealloc {
  [titles_ release];
  [images_ release];
  [super dealloc];
}

// images_, titles_를 NSArray형의 인스턴스 변수로 한다
- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  // 아이콘 이미지 읽기
  UIImage* image1 = [UIImage imageNamed:@"Elephant.png"];
  UIImage* image2 = [UIImage imageNamed:@"Lion.png"];
  UIImage* image3 = [UIImage imageNamed:@"Dog.png"];
  // 세그먼트에 표시할 아이콘 및 타이틀을 NSArray에 채운다	
  images_ = [[NSArray alloc] initWithObjects:image1, image2, image3, nil];
  titles_ = [[NSArray alloc] initWithObjects:@"Elephant", @"Lion", @"Dog", nil];
  // 세그먼트 초기화 표시는 텍스트로 한다	
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:titles_] autorelease];
  segment.segmentedControlStyle = UISegmentedControlStyleBordered;
  segment.frame = CGRectMake( 10, 50, 300, 30 );
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];

  [self.view addSubview:segment];
}

- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    for ( int i = 0; i < segment.numberOfSegments; ++i ){
      if ( i == segment.selectedSegmentIndex ) {
        [segment setImage:[images_ objectAtIndex:i] forSegmentAtIndex:i];
      } else {
        [segment setTitle:[titles_ objectAtIndex:i] forSegmentAtIndex:i];
      }
    }
  } 
}

@end

//
//  SampleForSegmentedControl.m
//
//  Created by ToKoRo on 2009-10-01.
//

#import "SampleForSegmentedControl.h"

@implementation SampleForSegmentedControl

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  // 2개의 세그먼트를 문자열로 정의
  NSArray* items = [NSArray arrayWithObjects:@"Black", @"White", nil];
  // NSArray형식의 배열로 세그먼티드 컨트롤을 초기화
  UISegmentedControl* segment =
    [[[UISegmentedControl alloc] initWithItems:items] autorelease];
  // 디폴트로는 가장 왼쪽의 세그먼트를 선택
  segment.selectedSegmentIndex = 0;
  segment.frame = CGRectMake( 0, 0, 130, 30 );
  [segment addTarget:self
              action:@selector(segmentDidChange:)
       forControlEvents:UIControlEventValueChanged];
  // 세그먼티드 컨트롤을 네비게이션 바에 추가	
  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithCustomView:segment] autorelease];
  self.navigationItem.rightBarButtonItem = barButton;
}

// 세그먼트의 선택이 변경되었을 때에 호출된다
- (void)segmentDidChange:(id)sender {
  if ( [sender isKindOfClass:[UISegmentedControl class]] ) {
    UISegmentedControl* segment = sender;
    if ( 0 == segment.selectedSegmentIndex ) {
	  // 선택되어 있는 것이 가장 왼쪽의 세그먼트라면 배경색을 검정색으로 한다	
      self.view.backgroundColor = [UIColor blackColor];
    } else {
	  // 선택되어 있는 것이 가장 왼쪽의 세그먼트라면 배경색을 흰색으로 한다	
      self.view.backgroundColor = [UIColor whiteColor];
    }
  } 
}

@end

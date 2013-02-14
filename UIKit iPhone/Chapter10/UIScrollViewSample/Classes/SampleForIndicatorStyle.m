//
//  SampleForIndicatorStyle.m
//
//  Created by ToKoRo on 2009-10-21.
//
		
#import "SampleForIndicatorStyle.h"

@implementation SampleForIndicatorStyle

- (void)dealloc {
  [scrollView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 스크롤뷰 초기화
  scrollView_ = [[UIScrollView alloc] init];
  scrollView_.frame = self.view.bounds;
  scrollView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // 스크롤뷰 할 수 있는 범위를 설정
  UIView* view = [[[UIView alloc] init] autorelease];
  view.frame = CGRectMake( 0, 0, 800, 600 );
  view.backgroundColor = [UIColor grayColor];
  scrollView_.contentSize = view.bounds.size;
  [scrollView_ addSubview:view];
  // 스크롤뷰를 화면에 붙이기
  [self.view addSubview:scrollView_];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"Style전환"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(changeButtonDidPush)] autorelease];
  [self setToolbarItems:[NSArray arrayWithObject:barButton]];
}

- (void)changeButtonDidPush {
  if ( UIScrollViewIndicatorStyleWhite < ++scrollView_.indicatorStyle ) {
    scrollView_.indicatorStyle = UIScrollViewIndicatorStyleDefault;
  } 
}

@end

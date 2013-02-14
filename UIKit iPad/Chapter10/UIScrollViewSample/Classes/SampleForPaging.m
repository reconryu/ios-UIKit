//
//  SampleForPaging.m
//
//  Created by ToKoRo on 2009-10-20.
//  Last Change: 2009-10-21.
//

#import "SampleForPaging.h"

#pragma mark ----- MyViewController -----

@implementation MyViewController

@synthesize number = number_;

// 수치를 지정해서 MyViewController 인스턴스를 취득하는 클래스 메소드	
+ (MyViewController*)myViewControllerWithNumber:(NSInteger)number {
  MyViewController* myViewController = [[[MyViewController alloc] init] autorelease];
  myViewController.number = number;
  return myViewController;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.backgroundColor = ( self.number % 2 ) ? [UIColor blackColor] : [UIColor whiteColor];
  label.textColor = !( self.number % 2 ) ? [UIColor blackColor] : [UIColor whiteColor];
  label.textAlignment = UITextAlignmentCenter;
  label.font = [UIFont boldSystemFontOfSize:128];
  label.text = [NSString stringWithFormat:@"%d", self.number];
  [self.view addSubview:label];
}

@end

#pragma mark ----- SampleForPaging -----

@implementation SampleForPaging

static const NSInteger kNumberOfPages = 3;
static const NSInteger kViewHeight = 768;

- (void)viewDidLoad {
  [super viewDidLoad];

  // 스크롤뷰 초기화
  UIScrollView* scrollView = [[[UIScrollView alloc] init] autorelease];
  scrollView.frame = self.view.bounds;
  scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // 옆으로 페이지 스크롤 할 수 있도록 컨텐츠의 크기를 가로로 길게 설정
  scrollView.contentSize = CGSizeMake( 768 * kNumberOfPages, kViewHeight );
  // 페이지 마다의 스크롤로 한다
  scrollView.pagingEnabled = YES;
  // 스크롤바를 비표시로 한다
  scrollView.showsHorizontalScrollIndicator = NO;
  scrollView.showsVerticalScrollIndicator = NO;
  // 상태바 탭으로 위로 스크롤하는 기능을 OFF로 한다
  scrollView.scrollsToTop = NO;
  // 스크롤 뷰에 각 화면을 붙인다
  for ( int i = 0; i < kNumberOfPages; ++i ){
    MyViewController* myViewController = [MyViewController myViewControllerWithNumber:i];
    myViewController.view.frame = CGRectMake( 768 * i, 0, 768, kViewHeight );
    [scrollView addSubview:myViewController.view];
  }
  // 스크롤뷰를 각 화면에 붙인다
  [self.view addSubview:scrollView];
}

@end

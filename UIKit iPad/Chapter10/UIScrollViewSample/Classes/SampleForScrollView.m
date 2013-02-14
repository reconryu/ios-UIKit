//
//  SampleForScrollView.m
//
//  Created by ToKoRo on 2009-10-20.
//

#import "SampleForScrollView.h"

@implementation SampleForScrollView

- (void)viewDidLoad {
  [super viewDidLoad];

  // 스크롤뷰 초기화
  UIScrollView* scrollView = [[[UIScrollView alloc] init] autorelease];
  scrollView.frame = self.view.bounds;
  scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  // 스크롤뷰에 이미지를 설정 
  UIImage* image = [UIImage imageNamed:@"fountain.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  [scrollView addSubview:imageView];
  // 스크롤뷰가 관리할 컨텐츠 사이즈 == 이미지 크기로 한다
  scrollView.contentSize = imageView.bounds.size;
  // 스크롤뷰를 화면에 붙이기
  [self.view addSubview:scrollView];

  // 확대/축소 대응
  scrollView.delegate = self;
  scrollView.minimumZoomScale = 0.1;
  scrollView.maximumZoomScale = 3.0;
}

// 확대/축소 대응


- (UIView*)viewForZoomingInScrollView:(UIScrollView*)scrollView {
  for ( id subview in scrollView.subviews ) {
    if ( [subview isKindOfClass:[UIImageView class]] ) {
      return subview;
    }
  }
  return nil;
}

@end

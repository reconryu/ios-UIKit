//
//  SampleForUIImageView.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForUIImageView.h"

@implementation SampleForUIImageView

- (void)viewDidLoad {
  [super viewDidLoad];

  // 이미지 파일 읽기
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  // UIImageView의 작성
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  // 장소와 자동 크기 조절의 설정
  imageView.center = self.view.center;
  imageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin |
                               UIViewAutoresizingFlexibleBottomMargin;
  // 화면에 붙이기
  [self.view addSubview:imageView];
}

@end

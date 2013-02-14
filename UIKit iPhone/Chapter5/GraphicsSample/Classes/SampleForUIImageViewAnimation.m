//
//  SampleForUIImageViewAnimation.m
//
//  Created by ToKoRo on 2009-09-13.
//

#import "SampleForUIImageViewAnimation.h"

@implementation SampleForUIImageViewAnimation

- (void)dealloc {
  [imageView_ release];  
  [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 // 애니메이션 시작
 [imageView_ startAnimating];
}

- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 // 애니메이션 정지
 [imageView_ stopAnimating];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* chara1 = [UIImage imageNamed:@"chara1.png"];
  UIImage* chara2 = [UIImage imageNamed:@"chara2.png"];

  imageView_ = [[UIImageView alloc] init];
  imageView_.frame = CGRectMake( 0, 0, 64, 64 );
  // 애니메이션의 한 화면이 될 이미지를 NSArray 형식으로 설정
  imageView_.animationImages = [NSArray arrayWithObjects:chara1, chara2, nil];
  // 0.5초 간격으로 한 화면이 바뀌도록 설정
  imageView_.animationDuration = 0.5;

  imageView_.center = self.view.center;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

@end

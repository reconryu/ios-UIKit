//
//  SampleForFullScreenWithTransparent.m
//
//  Created by ToKoRo on 2009-08-22.
//

#import "SampleForFullScreenWithTransparent.h"

@implementation SampleForFullScreenWithTransparent

- (void)viewDidLoad {
  [super viewDidLoad];

  // 이미지 추가
  UIImage* image = [UIImage imageNamed:@"town.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  imageView.frame = self.view.bounds;
  imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  imageView.contentMode = UIViewContentModeScaleAspectFill;
  [self.view addSubview:imageView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  fullScreen_ = NO;
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];

  	
  // 상태 바/내비게이션 바/툴 바를 투과
  [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackTranslucent;
  self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
  self.navigationController.navigationBar.translucent = YES;
  self.navigationController.toolbar.barStyle = UIBarStyleBlack;
  self.navigationController.toolbar.translucent = YES;
  // 이것을 지정하지 않으면 상태 바의 아래에 그릴 수 없다.
  self.wantsFullScreenLayout = YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  fullScreen_ = !fullScreen_;

  BOOL needAnimation = YES;

  if ( needAnimation ) {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
	 
  } 

  [[UIApplication sharedApplication] setStatusBarHidden:fullScreen_ withAnimation:needAnimation];
  self.navigationController.navigationBar.alpha = fullScreen_ ? 0.0 : 1.0;
  self.navigationController.toolbar.alpha = fullScreen_ ? 0.0 : 1.0;
	
  if ( needAnimation ) {
    [UIView commitAnimations];
  }
 
	
	
}

@end

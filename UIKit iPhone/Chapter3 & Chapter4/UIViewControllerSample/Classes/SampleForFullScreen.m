//
//  SampleForFullScreen.m
//
//  Created by ToKoRo on 2009-08-20.
//

#import "SampleForFullScreen.h"

@implementation SampleForFullScreen

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
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  fullScreen_ = !fullScreen_;
  // 상태 바 → 내비게이션 바의 순서로 하지 않으면 이상한 공간이 열려 버린다
  [[UIApplication sharedApplication] setStatusBarHidden:fullScreen_ withAnimation:YES];
  [self.navigationController setNavigationBarHidden:fullScreen_ animated:YES];
  [self.navigationController setToolbarHidden:fullScreen_ animated:YES];
	
  CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
  CGRect bounds = [[UIScreen mainScreen] bounds];
  NSLog( @"applicationFrame( %f, %f, %f, %f )", applicationFrame.origin.x, applicationFrame.origin.y, applicationFrame.size.width, applicationFrame.size.height );
  NSLog( @"bounds( %f, %f, %f, %f )", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height );	
}

@end

//
//  SampleForTransform.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForTransform.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForTransform ()
- (void)rotateDidPush;
- (void)bigDidPush;
- (void)smallDidPush;
- (void)invertDidPush;
- (void)transformWithAnimation;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForTransform

// finalize
- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  rotate_ = 0.0;
  scale_ = 1.0;
  needFlip_ = NO;

  // 배경을 검정색으로
  self.view.backgroundColor = [UIColor blackColor];

  // 이미지 View를 추가
  NSString* path = [NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], @"dog.jpg"];
  UIImage* image = [[[UIImage alloc] initWithContentsOfFile:path] autorelease];

  imageView_ = [[UIImageView alloc] initWithImage:image];
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.center.y - 60;
  imageView_.center = newPoint;

  [self.view addSubview:imageView_];

  // 회전 버튼을 추가
  UIButton* rotateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  rotateButton.frame = CGRectMake( 0, 0, 50, 40 );
  newPoint = self.view.center;
  newPoint.x -= 75;
  newPoint.y = self.view.frame.size.height - 70;
  rotateButton.center = newPoint;
  [rotateButton setTitle:@"회전" forState:UIControlStateNormal];
  [rotateButton addTarget:self
                action:@selector(rotateDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 확대 버튼을 추가
  UIButton* bigButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  bigButton.frame = rotateButton.frame;
  newPoint.x += 50;
  bigButton.center = newPoint;
  [bigButton setTitle:@"확대" forState:UIControlStateNormal];
  [bigButton addTarget:self
                action:@selector(bigDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 축소 버튼을 추가
  UIButton* smallButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  smallButton.frame = rotateButton.frame;
  newPoint.x += 50;
  smallButton.center = newPoint;
  [smallButton setTitle:@"축소" forState:UIControlStateNormal];
  [smallButton addTarget:self
                action:@selector(smallDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 반전 버튼을 추가
  UIButton* invertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  invertButton.frame = rotateButton.frame;
  newPoint.x += 50;
  invertButton.center = newPoint;
  [invertButton setTitle:@"반전" forState:UIControlStateNormal];
  [invertButton addTarget:self
                action:@selector(invertDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:rotateButton];
  [self.view addSubview:bigButton];
  [self.view addSubview:smallButton];
  [self.view addSubview:invertButton];
}

#pragma mark ----- Private Methods -----

- (void)rotateDidPush {
  // 90도씩 회전 시킨다
  rotate_ += 90.0;
  if ( 359.0 < rotate_ ) {
    rotate_ = 0.0;
  } 
  [self transformWithAnimation];
}

- (void)bigDidPush {
  // 0.1씩 확대한다
  scale_ += 0.1;
  [self transformWithAnimation];
}

- (void)smallDidPush {
  // 0.1씩 축소한다
  scale_ -= 0.1;
  [self transformWithAnimation];
}

- (void)invertDidPush {
  // 좌우를 반전한다
  needFlip_ = !needFlip_;
  [self transformWithAnimation];
}

- (void)transformWithAnimation {
  [UIView beginAnimations:nil context:NULL];

  CGAffineTransform transformRotate =
    CGAffineTransformMakeRotation( rotate_ * ( M_PI / 180.0 ) );
  CGAffineTransform transformScale =
    CGAffineTransformMakeScale( scale_, scale_ );
  CGAffineTransform transformAll =
    CGAffineTransformConcat( transformRotate, transformScale );
  if ( needFlip_ ) {
    transformAll = CGAffineTransformScale( transformAll, -1.0, 1.0 );
  } 
  imageView_.transform = transformAll;

  [UIView commitAnimations];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

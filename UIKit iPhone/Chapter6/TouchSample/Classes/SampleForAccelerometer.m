//
//  SampleForAccelerometer.m
//
//  Created by ToKoRo on 2009-09-07.
//

#import "SampleForAccelerometer.h"

#pragma mark ----- Private Methods Definition -----

//@interface SampleForAccelerometer ()
//- (CGFloat)lowpassFilter:(CGFloat)accel before:(CGFloat)before;
//- (CGFloat)highpassFilter:(CGFloat)accel before:(CGFloat)before;
//@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForAccelerometer

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // 볼 이미지를 화면에 붙이기
  UIImage* image = [UIImage imageNamed:@"metal.png"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.center = self.view.center;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

- (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
  speedX_ = speedY_ = 0.0;
  // 가속도 센서로부터 값 취득 시작
  UIAccelerometer* accelerometer = [UIAccelerometer sharedAccelerometer];
  accelerometer.updateInterval = 1.0 / 60.0; //< 60Hz
  accelerometer.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  
  // 가속도 센서로부터 값 취득 종료
  UIAccelerometer* accelerometer = [UIAccelerometer sharedAccelerometer];
  accelerometer.delegate = nil;
}

// 가속도 센서로부터의 통지
- (void)accelerometer:(UIAccelerometer*)accelerometer
  didAccelerate:(UIAcceleration*)acceleration
{
  speedX_ += acceleration.x;  //< x방향으로 구르는 스피드를 가속 시킨다 (반대방향이라면 감속)
  speedY_ += acceleration.y;  //< y방향으로 구르는 스피드를 가속 시킨다 (반대방향이라면 감속)
  CGFloat posX = imageView_.center.x + speedX_;  //< 스피드에 따라　볼의 위치를 변경 
  CGFloat posY = imageView_.center.y - speedY_;  //< 스피드에 따라　볼의 위치를 변경
  // 구석에 닿으면 튀어오르는 처리
  if ( posX < 0.0 ) {
    posX = 0.0;
    speedX_ *= -0.4; //< 왼쪽벽이면 0.4의 힘으로 튀어오른다.
  } else if ( posX > self.view.bounds.size.width ) {
    posX = self.view.bounds.size.width;
    speedX_ *= -0.4; //< 오른쪽벽이면 0.4의 힘으로 튀어오른다.
  }
  if ( posY < 0.0 ) {
    posY = 0.0;
    speedY_ = 0.0; //< 위쪽 벽이면 튀어 오르지 않는다.
  } else if ( posY > self.view.bounds.size.height ) {
    posY = self.view.bounds.size.height;
    speedY_ *= -1.5; //< 아래 벽이면 1.5배의 힘으로 튀어오른다.
  }
  imageView_.center = CGPointMake( posX, posY );
}


@end

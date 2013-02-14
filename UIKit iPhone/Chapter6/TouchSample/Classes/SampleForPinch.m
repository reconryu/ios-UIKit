//
//  SampleForPinch.m
//
//  Created by ToKoRo on 2009-09-06.
//

#import "SampleForPinch.h"
#import <math.h>

#pragma mark ----- Private Methods Definition -----

// private함수 정의
@interface SampleForPinch ()
- (CGFloat)distanceWithPointA:(CGPoint)pointA pointB:(CGPoint)pointB;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForPinch

- (void)dealloc {
  [imageView_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];
  self.view.multipleTouchEnabled = YES;
  // UIImageView 붙이기
  UIImage* image = [UIImage imageNamed:@"dog.jpg"];
  imageView_ = [[UIImageView alloc] initWithImage:image];
  imageView_.center = self.view.center;
  imageView_.contentMode = UIViewContentModeScaleAspectFill;
  imageView_.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                UIViewAutoresizingFlexibleRightMargin |
                                UIViewAutoresizingFlexibleTopMargin |
                                UIViewAutoresizingFlexibleBottomMargin;
  [self.view addSubview:imageView_];
}

#pragma mark ----- Responder -----

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( 2 == [touches count] ) {
    // ２개 손가락으로 터치하는 경우는 2점간의 거리를 계산
    // 현재의 거리와 전 회의 거리가 줄어들었는지 늘어났는지를 판별
    NSArray* twoFingers = [touches allObjects];
    UITouch* touch1 = [twoFingers objectAtIndex:0];
    UITouch* touch2 = [twoFingers objectAtIndex:1];
    CGPoint previous1 = [touch1 previousLocationInView:self.view];
    CGPoint previous2 = [touch2 previousLocationInView:self.view];
    CGPoint now1 = [touch1 locationInView:self.view];
    CGPoint now2 = [touch2 locationInView:self.view];
    CGFloat previousDistance = [self distanceWithPointA:previous1 pointB:previous2];
    CGFloat distance = [self distanceWithPointA:now1 pointB:now2];

    CGFloat scale = 1.0;
    if ( previousDistance > distance ) {
      // 거리가 줄어들면 핀치인
      scale -= ( previousDistance - distance ) / 300.0;
    } else if ( distance > previousDistance ) {
      // 거리가 늘어나면 핀치아웃
      scale += ( distance - previousDistance ) / 300.0;
    } 
    CGAffineTransform newTransform =
      CGAffineTransformScale( imageView_.transform, scale, scale ); 
    imageView_.transform = newTransform;
    imageView_.center = self.view.center;
  } 
}

#pragma mark ----- Private Methods -----

- (CGFloat)distanceWithPointA:(CGPoint)pointA pointB:(CGPoint)pointB {
  CGFloat dx = fabs( pointB.x - pointA.x );
  CGFloat dy = fabs( pointB.y - pointA.y );
  return sqrt( dx * dx + dy * dy );
}

@end

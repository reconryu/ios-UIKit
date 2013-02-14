//
//  SampleForAccelerometer.h
//
//  Created by ToKoRo on 2009-09-07.
//

#import <UIKit/UIKit.h>

// UIAccelerometer로부터의 통지를 받기 위해 
// UIAccelerometerDelegate 프로토콜 구현을 선언하는 것을 잊지 않도록
@interface SampleForAccelerometer : UIViewController <UIAccelerometerDelegate>  
{
 @private
  UIImageView* imageView_;      //< 볼 이미지
  UIAccelerationValue speedX_;  //< x축 방향으로 볼이 구르는 스피드
  UIAccelerationValue speedY_;  //< y축 방향으로 볼이 구르는 스피드
}

@end

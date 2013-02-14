//
//  SampleForSlide.h
//
//  Created by ToKoRo on 2009-09-02.
//

#import <UIKit/UIKit.h>

// 가로방향, 세로방향 어느 쪽으로 슬라이드했는가의 정수
typedef enum
{
  kSlideNone,       // 아직 슬라이드하지 않을 시에 사용한다
  kSlideHorizontal, // 가로방향으로 슬라이드 시에 사용한다
  kSlideVertical,   // 세로방향으로 슬라이드 시에 사용한다
} DirectionForSlide;

@interface SampleForSlide : UIViewController
{
 @private
  UILabel* label_;
  CGPoint touchBegan_;
  CGPoint labelOrigin_;
  DirectionForSlide direction_;
}

@end

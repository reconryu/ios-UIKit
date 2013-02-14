//
//  SampleForDrag.h
//
//  Created by ToKoRo on 2009-09-01.
//

#import <UIKit/UIKit.h>

@interface SampleForDrag : UIViewController
{
 @private
  UIImageView* character_;   // 캐릭터를 표시시키기 위한 UIImageViewer
  BOOL shouldWalk_;          // 캐릭터가 계속 걸어갈지 여부에 대한 플래그  
  CGPoint targetPoint_;      // 현재 손가락 위치를 여기에 보존한다
}

@end

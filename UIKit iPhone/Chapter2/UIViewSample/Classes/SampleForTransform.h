//
//  SampleForTransform.h
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleBaseController.h"

@interface SampleForTransform : SampleBaseController
{
 @private
  UIImageView* imageView_;
  CGFloat rotate_;
  CGFloat scale_;
  bool    needFlip_;
}

@end

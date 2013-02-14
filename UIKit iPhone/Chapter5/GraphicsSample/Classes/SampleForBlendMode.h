//
//  SampleForBlendMode.h
//
//  Created by ToKoRo on 2009-09-13.
//

#import <UIKit/UIKit.h>

@interface BlendModeTest : UIView
{
 @private
  UIImage* frontImage_;
  UIImage* backImage_;
  CGBlendMode blendMode_;
}

@property (nonatomic, assign) CGBlendMode blendMode;

- (void)changeMode;

@end

@interface SampleForBlendMode : UIViewController
{
 @private
  BlendModeTest* test_;
  UILabel* label_;
}
@end

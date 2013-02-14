//
//  SampleForUIImage.h
//
//  Created by ToKoRo on 2009-09-13.
//

#import <UIKit/UIKit.h>

@interface DrawImageTest : UIView
{
 @private
  UIImage* image_;
}

- (id)initWithImage:(UIImage*)image;

@end

@interface SampleForUIImage : UIViewController
@end

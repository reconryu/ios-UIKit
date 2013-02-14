//
//  SampleForLineBreak.h
//
//  Created by ToKoRo on 2009-09-09.
//

#import <UIKit/UIKit.h>

@interface LineBreakTest : UIView
{
 @private
  UILineBreakMode lineBreakMode_;
}

- (id)initWithLineBreakMode:(UILineBreakMode)mode;

@end

@interface SampleForLineBreak : UIViewController
@end

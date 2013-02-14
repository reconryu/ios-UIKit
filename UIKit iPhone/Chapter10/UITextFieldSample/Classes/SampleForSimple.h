//
//  SampleForSimple.h
//
//  Created by ToKoRo on 2009-09-28.
//

#import <UIKit/UIKit.h>

@interface SampleForSimple : UIViewController <UITextFieldDelegate>
{
 @private
  NSArray* textFields_;
  NSUInteger currentFieldIndex_;
}
@end

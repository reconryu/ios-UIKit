//
//  SampleForViewForRow.h
//
//  Created by ToKoRo on 2009-10-03.
//

#import <UIKit/UIKit.h>

@interface SampleForViewForRow : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
 @private
  UIPickerView* picker_;
  NSArray* dataSource_;
}
@end

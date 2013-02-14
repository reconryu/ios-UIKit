//
//  SampleForBaselineAdjustment.h
//
//  Created by ToKoRo on 2009-09-09.
//

#import <UIKit/UIKit.h>

@interface BaselineAdjustmentTest : UIView
{
 @private
  UIBaselineAdjustment baselineAdjustment_;
}

- (id)initWithBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment;

@end

@interface SampleForBaselineAdjustment : UIViewController
@end

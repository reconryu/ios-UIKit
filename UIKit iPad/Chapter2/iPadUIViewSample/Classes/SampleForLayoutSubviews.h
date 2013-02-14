//
//  SampleForLayoutSubviews.h
//
//  Created by ToKoRo on 2009-08-13.
//

#import "SampleBaseController.h"

#pragma mark ----- LayoutTest -----

@interface LayoutTest : UILabel
{
 @private
  UILabel* child1_;
  UILabel* child2_;
}

@end 

#pragma mark ----- SampleForLayoutSubviews -----

@interface SampleForLayoutSubviews : SampleBaseController
{
 @private
  LayoutTest* label_;
}

@end


//
//  SampleForProgressViewOnToolbar.h
//
//  Created by ToKoRo on 2009-10-04.
//

#import <UIKit/UIKit.h>

#pragma mark ----- ProgressViewWithLabel -----

@interface ProgressViewWithLabel : UIView
{
 @protected
  UIProgressView* progressView_;
  UILabel* textLabel_;
}

@property (nonatomic, retain) UIProgressView* progressView;
@property (nonatomic, retain) UILabel* textLabel;

@end

#pragma mark ----- SampleForProgressViewOnToolbar -----

@interface SampleForProgressViewOnToolbar : UIViewController
{
 @private
  ProgressViewWithLabel* component_;
}

@end

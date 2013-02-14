//
//  SampleForHTMLViewer.h
//
//  Created by ToKoRo on 2009-09-21.
//

#import <UIKit/UIKit.h>

@interface SampleForHTMLViewer : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIActivityIndicatorView* activityIndicator_;
}

@end

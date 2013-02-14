//
//  SampleForWebView.h
//
//  Created by ToKoRo on 2009-09-21.
//

#import <UIKit/UIKit.h>

@interface SampleForWebView : UIViewController <UIWebViewDelegate>
{
 @private
  UIWebView* webView_;
  UIBarButtonItem* reloadButton_;
  UIBarButtonItem* stopButton_;
  UIBarButtonItem* backButton_;
  UIBarButtonItem* forwardButton_;
}
@end

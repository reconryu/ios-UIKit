//
//  SampleForLoadHTMLString.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForLoadHTMLString.h"

@implementation SampleForLoadHTMLString

- (void)dealloc {
  [webView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"loadHTMLString";

  // UIWebView 설정
  webView_ = [[UIWebView alloc] init];
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.dataDetectorTypes = UIDataDetectorTypeAll;
  [self.view addSubview:webView_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  NSString* html = @"<b>【전화번호】</b><br />"
                    "090-0000-0000<hr />"
                    "<b>【홈페이지】</b><br />"
                    "http://www.apple.com/";
  [webView_ loadHTMLString:html baseURL:nil];
}

@end

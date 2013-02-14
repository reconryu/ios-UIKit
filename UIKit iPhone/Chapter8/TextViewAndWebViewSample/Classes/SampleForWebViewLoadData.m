//
//  SampleForWebViewLoadData.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForWebViewLoadData.h"

@implementation SampleForWebViewLoadData

- (void)dealloc {
  [activityIndicator_ release]; 
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil;
  [webView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"loadData";

  // UIWebView 설정
  webView_ = [[UIWebView alloc] init];
  webView_.delegate = self;
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:webView_];

  // 툴바 설정
  activityIndicator_ = [[UIActivityIndicatorView alloc] init];
  activityIndicator_.frame = CGRectMake( 0, 0, 20, 20 );
  UIBarButtonItem* indicator =
    [[[UIBarButtonItem alloc] initWithCustomView:activityIndicator_] autorelease];
  UIBarButtonItem* adjustment =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                    target:nil
                                                    action:nil] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:adjustment, indicator, adjustment, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
   NSString* path;
  if ( path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"pdf"] ) {
    NSData* data = [NSData dataWithContentsOfFile:path];
    [webView_ loadData:data MIMEType:@"application/pdf" textEncodingName:nil baseURL:nil];
  } else {
    NSLog( @"file not found." );
  }
  
/*
  NSString* path = [[NSBundle mainBundle] pathForResource:@"sample.doc" ofType:nil];
  NSURL* url = [NSURL fileURLWithPath:path];
  NSURLRequest* request = [NSURLRequest requestWithURL:url];
  [webView_ loadRequest:request];
*/
}

- (void)updateControlEnabled {
  if ( webView_.loading ) {
    [activityIndicator_ startAnimating];
  } else {
    [activityIndicator_ stopAnimating];
  }
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
  NSLog( @"webViewDidStartLoad" );
  [self updateControlEnabled];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
  NSLog( @"webViewDidFinishLoad" );
  [self updateControlEnabled];
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
  NSLog( @"didFailLoadWithError:%d", error.code );
  NSLog( @"%@", error.localizedDescription );
  [self updateControlEnabled];
}

@end

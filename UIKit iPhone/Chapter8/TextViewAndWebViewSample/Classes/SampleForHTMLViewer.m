//
//  SampleForHTMLViewer.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForHTMLViewer.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForHTMLViewer ()
- (void)loadHTMLFile:(NSString*)path;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForHTMLViewer

- (void)dealloc {
  [activityIndicator_ release]; 
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil;
  [webView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"HTMLViewer";

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

// 지정한 HTML파일을 읽어 들이는 private메소드
- (void)loadHTMLFile:(NSString*)path {
  NSArray* components = [path pathComponents];
  NSString* resourceName = [components lastObject];
  NSString* absolutePath;
  if ( absolutePath = [[NSBundle mainBundle] pathForResource:resourceName ofType:nil] ) {
    NSData* data = [NSData dataWithContentsOfFile:absolutePath];
    [webView_ loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:nil];
  } else {
    NSLog( @"%@ not found.", resourceName );
  }
}

- (void)updateControlEnabled {
  if ( webView_.loading ) {
    [activityIndicator_ startAnimating];
  } else {
    [activityIndicator_ stopAnimating];
  }
}

- (BOOL)webView:(UIWebView*)webView
  shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
// 링크가 탭되면 href속성의 HTML파일을 다음의 화면으로서 읽어 들인다
  if ( UIWebViewNavigationTypeLinkClicked == navigationType ) {
    NSString* url = [[request URL] path];
    [self loadHTMLFile:url];
    return FALSE;
  } else if ( UIWebViewNavigationTypeFormSubmitted == navigationType ) {
    NSString* url = [[request URL] path];
    NSArray* components = [url pathComponents];
    NSString* resultString = [webView stringByEvaluatingJavaScriptFromString:[components lastObject]];
    UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
    alert.message = resultString;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    return FALSE;
  }
  return TRUE;
}

// 화면이 표시되면 먼저 [top.htm]을 표시한다
- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self loadHTMLFile:@"top.htm"];
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

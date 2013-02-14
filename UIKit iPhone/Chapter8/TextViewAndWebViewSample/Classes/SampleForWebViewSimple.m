//
//  SampleForWebViewSimple.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForWebViewSimple.h"

@implementation SampleForWebViewSimple

- (void)dealloc {
  [activityIndicator_ release]; 
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil; //< Apple의 문서에 release전에 이것이 필요하다고 기재되어 있다
  [webView_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"통신 중 상태를 표시한다";
  // UIWebView 설정
  webView_ = [[UIWebView alloc] init];
  webView_.delegate = self;
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.scalesPageToFit = YES;
  [self.view addSubview:webView_];
  // 툴 바에 액티비티 인디게이터를 추가 
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
  // Web 페이지 표시
  NSURLRequest* request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
  [webView_ loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
  // 데이터 읽기가 시작되면 액티비티 인디게이터를 움직인다
  [activityIndicator_ startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
  // 데이터 읽기가 끝나면 액티비티 인디게이터를 멈춘다	
  [activityIndicator_ stopAnimating];
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
  // 에러 종료하면 액티비티 인디게이터를 멈춘다
  [activityIndicator_ stopAnimating];
}

@end

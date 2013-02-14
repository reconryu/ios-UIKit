//
//  SampleForWebView.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForWebView.h"

@implementation SampleForWebView

- (void)dealloc {
  if ( webView_.loading ) [webView_ stopLoading];
  webView_.delegate = nil;
  [webView_ release]; 
  [reloadButton_ release]; 
  [stopButton_ release]; 
  [backButton_ release]; 
  [forwardButton_ release]; 
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"UIWebView테스트";
  // UIWebView 설정
  webView_ = [[UIWebView alloc] init];
  webView_.delegate = self;
  webView_.frame = self.view.bounds;
  webView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  webView_.scalesPageToFit = YES;
  [self.view addSubview:webView_];
  // 툴바에 버튼을 추가
  reloadButton_ =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:self
                                                  action:@selector(reloadDidPush)];
  stopButton_ =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                  target:self
                                                  action:@selector(stopDidPush)];
  backButton_ =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(backDidPush)];
  forwardButton_ =
    [[UIBarButtonItem alloc] initWithTitle:@"Forward"
                                     style:UIBarButtonItemStyleBordered
                                    target:self
                                    action:@selector(forwardDidPush)];
  NSArray* buttons =
    [NSArray arrayWithObjects:backButton_, forwardButton_, reloadButton_, stopButton_, nil];
  [self setToolbarItems:buttons animated:YES];

}

- (void)reloadDidPush {
  [webView_ reload]; //< 페이지 다시 읽기
}

- (void)stopDidPush {
  if ( webView_.loading ) {
    [webView_ stopLoading]; //< 읽어들이기 중지
  } 
}

- (void)backDidPush {
  if ( webView_.canGoBack ) {
    [webView_ goBack]; //< 앞 페이지로 돌아간다
  } 
}

- (void)forwardDidPush {
  if ( webView_.canGoForward ) {
    [webView_ goForward]; //< 다음 페이지로
  } 
}

- (void)updateControlEnabled {
  // 인디게이터나 버튼의 상태를 일괄로 갱신한다
  [UIApplication sharedApplication].networkActivityIndicatorVisible = webView_.loading;
  stopButton_.enabled = webView_.loading;
  backButton_.enabled = webView_.canGoBack;
  forwardButton_.enabled = webView_.canGoForward;
}

- (void)viewDidAppear:(BOOL)animated {
  // 화면이 표시되어 끝나면 Web 페이지의 읽기
  [super viewDidAppear:animated];
  NSURLRequest* request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
  [webView_ loadRequest:request];
  [self updateControlEnabled];
}

- (void)viewWillDisappear:(BOOL)animated {
  // 화면을 닫을 때 상태바의 인디게이터를 확실하게 OFF로 해 둔다
  [super viewWillDisappear:animated];
  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView*)webView {
  [self updateControlEnabled];
}

- (void)webViewDidFinishLoad:(UIWebView*)webView {
  [self updateControlEnabled];
}

- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error {
  [self updateControlEnabled];
}

@end

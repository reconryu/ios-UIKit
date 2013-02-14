//
//  SampleForStatusBarColor.m
//
//  Created by ToKoRo on 2009-08-27.
//

#import "SampleForStatusBarColor.h"

@implementation SampleForStatusBarColor

- (void)viewDidLoad {
  [super viewDidLoad];

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.text = @"화면을 탭 하면 상태 바의 색이 바뀝니다.";
  label.numberOfLines = 2;
  [self.view addSubview:label];

  self.wantsFullScreenLayout = YES;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:YES];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:YES animated:NO];
}

#pragma mark ----- Responder -----
  
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  UIApplication* app = [UIApplication sharedApplication];
  if ( UIStatusBarStyleDefault == app.statusBarStyle ) {
    app.statusBarStyle = UIStatusBarStyleBlackOpaque;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
  } else if ( UIStatusBarStyleBlackOpaque == app.statusBarStyle ) {
    app.statusBarStyle = UIStatusBarStyleBlackTranslucent;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
  } else {
    app.statusBarStyle = UIStatusBarStyleDefault;
    [self.navigationController setNavigationBarHidden:NO animated:NO];
  }
}

@end

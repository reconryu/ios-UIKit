//
//  SampleForNavigation.m
//
//  Created by ToKoRo on 2009-08-15.
//

#import "SampleForNavigation.h"

@implementation SampleForNavigation

- (void)viewDidLoad {
  [super viewDidLoad];

  // １행 메세지 추가
  self.navigationItem.prompt = @"１행 메시지";
  // 타이틀 설정
  self.navigationItem.title = @"타이틀";

  // 버튼을 우측에 추가
  UIBarButtonItem* rightItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                   target:nil
                                                   action:nil ] autorelease];
  self.navigationItem.rightBarButtonItem = rightItem;


  // UIImageView을 좌측에 추가
  UIImage* image = [UIImage imageNamed:@"face.jpg"];
  UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
  UIBarButtonItem* icon =
    [[[UIBarButtonItem alloc] initWithCustomView:imageView] autorelease];
  self.navigationItem.leftBarButtonItem = icon;

  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.backgroundColor = [UIColor blackColor];
  [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:NO];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  self.navigationItem.leftBarButtonItem = nil;
}

@end

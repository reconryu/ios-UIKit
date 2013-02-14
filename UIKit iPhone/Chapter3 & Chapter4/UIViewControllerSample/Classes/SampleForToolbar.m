//
//  SampleForToolbar.m
//
//  Created by ToKoRo on 2009-08-19.
//

#import "SampleForToolbar.h"


@interface NextViewController ()
- (void)nextDidPush;
@end 

@implementation NextViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"Next";
  self.view.backgroundColor = [UIColor whiteColor];

  // 다음 화면으로 버튼을 추가
  UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"다음 화면으로" forState:UIControlStateNormal];
  [button sizeToFit];
  button.center = self.view.center;
  button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
  [button addTarget:self
             action:@selector(nextDidPush)
   forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
 
}

- (void)nextDidPush {
  UIViewController* nextViewController = [[[NextViewController alloc] init] autorelease];

  // 처음 한 번만 hidesBottomBarWhenPushed를 YES로 한다.
  static BOOL nowFirst = YES;
  if ( nowFirst ) {
    nextViewController.hidesBottomBarWhenPushed = YES;
    nowFirst = FALSE;
    NSLog( @"nowFirst" );
  } 

  [self.navigationController pushViewController:nextViewController animated:YES];
}

@end

#pragma mark ----- Private Methods Definition -----

@interface SampleForToolbar ()
- (void)buttonDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForToolbar

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"SampleForToolbar";


  // 툴 바 좌측에 표시할 버튼
  UIBarButtonItem* button1 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                   target:self
                                                   action:@selector(buttonDidPush) ] autorelease];
  // 자동으로 크기가 조절되는 버튼간의 공백
  UIBarButtonItem* spacer =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                   target:nil
                                                   action:nil ] autorelease];
  // 툴 바의 우측에 표시할 버튼
  UIBarButtonItem* button2 =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo
                                                   target:self
                                                   action:@selector(buttonDidPush) ] autorelease];
  // 이것들을 모두 NSArray에 설정한다.
  NSArray* buttons = [NSArray arrayWithObjects:button1, spacer, button2, nil];

  // 조금전 준비한 NSArray를 툴바의 아이템으로 설정
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO animated:YES];
  [self.navigationController setToolbarHidden:NO animated:YES];
}

#pragma mark ----- Private Methods -----

- (void)buttonDidPush {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"INFORMATION"
                                                   message:@"buttonDidPush"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

@end

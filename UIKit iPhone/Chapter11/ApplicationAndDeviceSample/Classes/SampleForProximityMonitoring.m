//
//  SampleForProximityMonitoring.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForProximityMonitoring.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForProximityMonitoring ()
- (void)onDidPush;
- (void)offDidPush;
- (void)proximityStateDidChange;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForProximityMonitoring

- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  label_ = [[UILabel alloc] init];
  label_.frame = self.view.bounds;
  label_.textAlignment = UITextAlignmentCenter;
  label_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label_.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:label_];
}

// 화면이 열릴 때에 근접 센서의 ON/OFF를 검지할 수 있도록 NSNotificationCenter에 등록한다
- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self onDidPush];
  // 근접 센서의 ON/OFF를 private메소드의 proximityStateDidChange에 통지 시킨다
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(proximityStateDidChange)
                                               name:UIDeviceProximityStateDidChangeNotification
                                             object:nil];
}

#pragma mark ----- Private Methods -----

- (void)onDidPush {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"근접OFF"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(offDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
  // 근접 센서 OFF
  [UIDevice currentDevice].proximityMonitoringEnabled = NO;
  label_.text = @"";
}

- (void)offDidPush {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithTitle:@"근접ON"
                                      style:UIBarButtonItemStyleDone
                                     target:self
                                     action:@selector(onDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = button;
  // 근접 ON
  [UIDevice currentDevice].proximityMonitoringEnabled = YES;
}

- (void)proximityStateDidChange {
  if ( [UIDevice currentDevice].proximityState ) {
      // label_은 화면에 붙일 수 있는 UILabel로 한다
	  label_.text = @"지금 뭔가 어두워졌어";
  } 
}

@end

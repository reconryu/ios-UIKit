//
//  SampleForBatteryMonitor.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForBatteryMonitor.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForBatteryMonitor ()
- (void)refreshDidPush;
- (NSString*)batteryStateToString:(UIDeviceBatteryState)state;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForBatteryMonitor

- (void)dealloc {
  [textView_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  textView_ = [[UITextView alloc] init];
  textView_.editable = NO;
  textView_.frame = self.view.bounds;
  textView_.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView_.backgroundColor = [UIColor blackColor];
  textView_.textColor = [UIColor whiteColor];
  textView_.font = [UIFont systemFontOfSize:16];
  [self.view addSubview:textView_];

  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:self
                                                  action:@selector(refreshDidPush)];
  self.navigationItem.rightBarButtonItem = button;
  [button release];

  [UIDevice currentDevice].batteryMonitoringEnabled = YES;
  [self refreshDidPush];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(refreshDidPush)
                                               name:UIDeviceBatteryLevelDidChangeNotification
                                             object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(refreshDidPush)
                                               name:UIDeviceBatteryStateDidChangeNotification
                                             object:nil];
}

- (void)refreshDidPush {
  UIDevice* device = [UIDevice currentDevice];
  NSMutableString* text = [[NSMutableString alloc] initWithCapacity:1024]; 
  [text appendFormat:@"batteryState: %@\n", [self batteryStateToString:device.batteryState]];
  [text appendFormat:@"batteryLevel: %f\n", device.batteryLevel];
  textView_.text = text;
}

- (NSString*)batteryStateToString:(UIDeviceBatteryState)state {
  switch ( state ) {
    case UIDeviceBatteryStateUnplugged: return @"UIDeviceBatteryStateUnplugged";
    case UIDeviceBatteryStateCharging: return @"UIDeviceBatteryStateCharging";
    case UIDeviceBatteryStateFull: return @"UIDeviceBatteryStateFull";
    default: return @"UIDeviceBatteryStateUnknown";
  }
}

@end

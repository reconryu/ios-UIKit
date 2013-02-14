//
//  SampleForAlertWithLongMessage.m
//
//  Created by ToKoRo on 2009-09-19.
//

#import "SampleForAlertWithLongMessage.h"

@implementation SampleForAlertWithLongMessage

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.title = @"message가 긴 경우";
  alert.message = @"1번째\n2번째\n3번째\n4번째\n5번째\n6번째\n7번째\n8번째\n9번째\n10번째\n11번째\n12번째\n13번째";
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end

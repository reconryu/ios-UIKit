//
//  SampleForNetworkActivityIndicator.m
//
//  Created by ToKoRo on 2009-09-17.
//

#import "SampleForNetworkActivityIndicator.h"

@implementation SampleForNetworkActivityIndicator

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  UIApplication* application = [UIApplication sharedApplication];
  application.networkActivityIndicatorVisible = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  UIApplication* application = [UIApplication sharedApplication];
  application.networkActivityIndicatorVisible = NO;
}

@end

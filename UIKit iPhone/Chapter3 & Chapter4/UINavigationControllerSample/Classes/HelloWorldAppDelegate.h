//
//  HelloWorldAppDelegate.h
//
//  Created by ToKoRo on 2009-08-15.
//

#import <UIKit/UIKit.h>

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow* window_;
  UIViewController* rootController_;
}

@property (nonatomic, retain) UIWindow* window_;

@end


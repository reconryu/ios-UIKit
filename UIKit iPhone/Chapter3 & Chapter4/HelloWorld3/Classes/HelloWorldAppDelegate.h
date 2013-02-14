//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by user00 on 8/1/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window_;
	UIViewController* viewController1_;
	UIViewController* viewController2_;
}

@property (nonatomic, retain) UIWindow *window_;

@end


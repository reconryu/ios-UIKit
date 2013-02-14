//
//  iPadHelloWorldAppDelegate.h
//  iPadHelloWorld
//
//  Created by 세라 유 on 11. 2. 5..
//  Copyright 2011 아이티에스. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPadHelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window_;
	UIViewController* viewController1_;
	UIViewController* viewController2_;
}

@property (nonatomic, retain) UIWindow *window_;

@end


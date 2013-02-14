//
//  SampleForTabBar.h
//
//  Created by ToKoRo on 2009-08-17.
//

#import <UIKit/UIKit.h>

@interface SampleForTabBar : UITabBarController
@end

@interface SampleScene : UIViewController
- (id)initWithSystemItem:(UITabBarSystemItem)item badge:(NSString*)badge;
- (id)initWithFileName:(NSString*)fileName title:(NSString*)title;
@end


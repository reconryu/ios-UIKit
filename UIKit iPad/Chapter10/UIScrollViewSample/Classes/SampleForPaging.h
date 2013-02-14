//
//  SampleForPaging.h
//
//  Created by ToKoRo on 2009-10-20.
//  Last Change: 2009-10-21.
//

#import <UIKit/UIKit.h>

#pragma mark ----- MyViewController -----

@interface MyViewController : UIViewController
{
 @private
  NSInteger number_;
}

@property (nonatomic, assign) NSInteger number;
// 수치를 지정해서 MyViewController 인스턴스를 취득하는 클래스 메소드
+ (MyViewController*)myViewControllerWithNumber:(NSInteger)number;

@end

#pragma mark ----- SampleForPaging -----

@interface SampleForPaging : UIViewController
@end

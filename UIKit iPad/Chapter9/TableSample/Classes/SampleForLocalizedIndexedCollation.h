//
//  SampleForLocalizedIndexedCollation.h
//
//  Created by ToKoRo on 2009-10-18.
//

#import <UIKit/UIKit.h>

#pragma mark ----- Character -----

// name과 job이라고 하는 2개의 프로퍼티를 갖는 클래스 선언
@interface Character : NSObject
{
 @private
  NSString* name_;
  NSString* job_;
}

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* job;

@end

#pragma mark ----- SampleForLocalizedIndexedCollation -----

@interface SampleForLocalizedIndexedCollation : UITableViewController
{
 @private
  NSMutableArray* dataSource_;
}

@property (nonatomic, retain) NSMutableArray* dataSource;

@end

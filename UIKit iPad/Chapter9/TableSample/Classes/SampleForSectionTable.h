//
//  SampleForSectionTable.h
//
//  Created by ToKoRo on 2009-09-22.
//

#import <UIKit/UIKit.h>

@interface SampleForSectionTable : UITableViewController
{
 @private
  NSArray* keys_; //< 섹션에 간단하게 액세스하기 위해
  NSDictionary* dataSource_; //< 데이터소스를 사전형식으로 보관유지한다
}
@end

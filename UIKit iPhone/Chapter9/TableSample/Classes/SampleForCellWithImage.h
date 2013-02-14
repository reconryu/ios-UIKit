//
//  SampleForCellWithImage.h
//
//  Created by ToKoRo on 2009-09-23.
//

#import <UIKit/UIKit.h>

@interface SampleForCellWithImage : UITableViewController
{
 @protected
  NSArray* dataSource_;
  NSMutableArray* images_; //< 이미지 보관유지용 배열
}
@end

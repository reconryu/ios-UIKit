//
//  SampleForCellWithDetail.h
//
//  Created by ToKoRo on 2009-09-23.
//

#import <UIKit/UIKit.h>
#import "SampleForCellWithImage.h"

@interface SampleForCellWithDetail : SampleForCellWithImage
{
 @protected
  NSArray* details_;
  UITableViewCellStyle cellStyle_;
}
@end

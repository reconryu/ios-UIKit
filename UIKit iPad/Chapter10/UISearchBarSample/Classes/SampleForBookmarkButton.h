//
//  SampleForBookmarkButton.h
//
//  Created by ToKoRo on 2009-10-06.
//

#import <UIKit/UIKit.h>
#import "SampleForSearchBar.h"

@interface SampleForBookmarkButton : SampleForSearchBar
- (void)setCurrentText:(NSString*)text;
@end

@interface BookmarkDialog : UITableViewController
{
 @private
  NSArray* dataSource_;
  id parent_; //< weak
}
- (id)initWithParent:(UIViewController*)parent;
@end


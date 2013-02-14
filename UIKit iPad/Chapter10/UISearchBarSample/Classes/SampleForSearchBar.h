//
//  SampleForSearchBar.h
//
//  Created by ToKoRo on 2009-10-05.
//

#import <UIKit/UIKit.h>

@interface SampleForSearchBar : UITableViewController <UISearchBarDelegate>
{
 @protected
  UISearchBar* searchBar_;
  NSMutableArray* dataBase_;
  NSMutableArray* dataSource_;
}
@end

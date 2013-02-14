//
//  SampleForSearchDisplay.h
//
//  Created by ToKoRo on 2009-10-05.
//

#import <UIKit/UIKit.h>

@interface Item : NSObject
{
 @private
  BOOL weapon_;
  BOOL armor_;
  NSString* name_;
}

@property (nonatomic, assign, getter=isWeapon) BOOL weapon;
@property (nonatomic, assign, getter=isArmor) BOOL armor;
@property (nonatomic, copy) NSString* name;

+ (id)weaponWithName:(NSString*)name;
+ (id)armorWithName:(NSString*)name;
- (NSComparisonResult)compare:(Item*)aItem;

@end

@interface SampleForSearchDisplay : UITableViewController <UISearchDisplayDelegate>
{
 @protected
  UISearchDisplayController* searchDisplay_;
  NSMutableArray* dataSource_;
  NSMutableArray* searchResult_;
}
@end

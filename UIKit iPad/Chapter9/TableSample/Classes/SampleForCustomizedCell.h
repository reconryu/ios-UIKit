//
//  SampleForCustomizedCell.h
//
//  Created by ToKoRo on 2009-09-24.
//
/*
#import <UIKit/UIKit.h>
@interface SampleForCustomizedCell : UITableViewController 
{
@private
	NSArray* sections_;
	NSArray* dataSource_;
	NSMutableArray* sliderValues_;
}

@property (nonatomic, retain) NSArray* sections;
@property (nonatomic, retain) NSArray* dataSource;
@property (nonatomic, retain) NSMutableArray* sliderValues;

@end
*/

//
//  SampleForCustomizedCell.h
//
//  Created by ToKoRo on 2010-02-14.
//

#pragma mark ----- CellWithImageView -----

@interface CellWithImageView : UITableViewCell
{
@private
	UIImageView* imageView_;
}

@property (nonatomic, retain) UIImageView* imageView;

@end 

#pragma mark ----- CellWithSwitch -----

@interface CellWithSwitch : UITableViewCell
{
@private
	UISwitch* theSwitch_;
}

@property (nonatomic, retain) UISwitch* theSwitch;

@end 

#pragma mark ----- CellWithSlider -----

@protocol CellWithSliderDelegate
@required
- (void)slider:(UISlider*)slider valueDidChange:(float)value forRow:(NSUInteger)row;
@end 

@interface CellWithSlider : UITableViewCell
{
@private
	UISlider* slider_;
	NSUInteger row_;
	id delegate_;
}

@property (nonatomic, retain) UISlider* slider;
@property (nonatomic, assign) NSUInteger row;
@property (nonatomic, assign) id delegate;

@end 

#pragma mark ----- SampleForCustomizedCell -----

@interface SampleForCustomizedCell : UITableViewController <CellWithSliderDelegate>
{
@private
	NSArray* sections_;
	NSArray* dataSource_;
	NSMutableArray* sliderValues_;
}

@property (nonatomic, retain) NSArray* sections;
@property (nonatomic, retain) NSArray* dataSource;
@property (nonatomic, retain) NSMutableArray* sliderValues;

@end
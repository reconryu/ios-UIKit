//
//  SampleForCellWithBackgroundView.m
//
//  Created by ToKoRo on 2009-10-18.
//

#import "SampleForCellWithBackgroundView.h"

@implementation SampleForCellWithBackgroundView

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // 셀 배경색을 투명으로 한다	
  self.tableView.backgroundColor = [UIColor clearColor];
  // 하는 김에 구분선도 없도록 한다 	
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  dataSource_ = [[NSArray alloc] initWithObjects:@"ITEM 1", @"ITEM 2", @"ITEM 3", nil];
}

- (NSInteger)tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section {
  return [dataSource_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"basis-cell";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    UIImage* image = [UIImage imageNamed:@"frame.png"];
    UIImage* stretchableImage = [image stretchableImageWithLeftCapWidth:30 topCapHeight:30];
    UIImageView* imageView = [[[UIImageView alloc] initWithImage:stretchableImage] autorelease];
    cell.backgroundView = imageView;
    [cell autorelease];
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  return cell;
}

@end

//
//  SampleForBlackCellTable.m
//
//  Created by ToKoRo on 2009-09-23.
//

#import "SampleForBlackCellTable.h"

@implementation SampleForBlackCellTable

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tableView.backgroundColor = [UIColor blackColor]; //< 배경색 변경
  self.tableView.rowHeight = 128.0; //< 셀 크기 변경
//  self.tableView.separatorColor = [UIColor redColor]; //< 단락선을 붉게 한다
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;  // 단락선을 없앤다
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"basis-cell";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    [cell autorelease];
    cell.textLabel.textColor = [UIColor whiteColor]; //< 텍스트색 변경
    cell.textLabel.textAlignment = UITextAlignmentCenter; //< 정렬 변경
    cell.textLabel.font = [UIFont systemFontOfSize:64]; //< 폰트 변경
  }
  NSString* text = [dataSource_ objectAtIndex:indexPath.row];
  cell.textLabel.text = text;
  return cell;
}

@end

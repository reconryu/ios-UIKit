//
//  SampleForDeleteableRow.m
//
//  Created by ToKoRo on 2009-09-22.
//

#import "SampleForDeleteableRow.h"

@implementation SampleForDeleteableRow

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              @"ITEM 4", @"ITEM 5", @"ITEM 6",
                              @"ITEM 7", @"ITEM 8", @"ITEM 9",
                              @"ITEM 10", @"ITEM 11", @"ITEM 12",
                              nil ];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.tableView setEditing:YES animated:YES];
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
    [cell autorelease];
  }
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  return cell;
}

// 셀 추가/삭제요구
- (void)tableView:(UITableView*)tableView
  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath*)indexPath
{
  if ( UITableViewCellEditingStyleDelete == editingStyle ) {
    // 데이터 소스로부터 해당 항목을 삭제
    [dataSource_ removeObjectAtIndex:indexPath.row];
    // 테이블로부터 해당 셀을 삭제
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
  } 
}

//- (NSString*)tableView:(UITableView*)tableView
//  titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexPath
//{
//  return @"휴지통으로";
//}

@end

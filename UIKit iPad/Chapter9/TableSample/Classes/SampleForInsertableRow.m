//
//  SampleForInsertableRow.m
//
//  Created by ToKoRo on 2009-09-22.
//

#import "SampleForInsertableRow.h"

@implementation SampleForInsertableRow

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSMutableArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              @"신규추가", nil ];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self.tableView setEditing:YES animated:YES];
}

- (NSInteger)tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section {
  return dataSource_.count;
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

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView
  editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath
{
  // 편집 모드의 경우 마지막 Row만 삽입 모드로 한다
  if ( tableView.editing && dataSource_.count <= indexPath.row + 1 ) {
    return UITableViewCellEditingStyleInsert;
  } else {
    return UITableViewCellEditingStyleDelete;
  }
}

// 셀 추가/삭제 요구
- (void)tableView:(UITableView*)tableView
  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath*)indexPath
{
  if ( UITableViewCellEditingStyleDelete == editingStyle ) {
    // 데이터 소스로부터 실 데이터 삭제
    [dataSource_ removeObjectAtIndex:indexPath.row];
    // 테이블로부터 셀을 삭제
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationLeft];
  } else if ( UITableViewCellEditingStyleInsert == editingStyle ) {
    // 데이터소스에 1건 추가
    [dataSource_ insertObject:@"NEW ITEM" atIndex:( dataSource_.count - 1 )];
    // 테이블에 셀을 추가
    [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                     withRowAnimation:UITableViewRowAnimationBottom];
  }
}

@end

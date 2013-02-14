//
//  SampleForEditingAccessoryType.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForEditingAccessoryType.h"

@implementation SampleForEditingAccessoryType

- (void)viewDidLoad {
  [super viewDidLoad];
  // 상세정보용 텍스트 설정
  details_ = [[NSArray alloc] initWithObjects:@"13",
                                              @"1",
                                              @"0",
                                              @"255",
                                              nil];
  // 셀 스타일 디폴트 설정 
  cellStyle_ = UITableViewCellStyleValue1;
  // 네비게이션 바에 편집 버튼을 추가
  self.navigationItem.rightBarButtonItem = [self editButtonItem];

  self.tableView.allowsSelection = NO;
  self.tableView.allowsSelectionDuringEditing = YES;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  UITableViewCell* cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
  cell.editingAccessoryType = UITableViewCellAccessoryDetailDisclosureButton;
  return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView*)tableView
  editingStyleForRowAtIndexPath:(NSIndexPath*)indexPath
{
  return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView*)tableView
  shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath*)indexPath
{
  return NO;
}

- (void)tableView:(UITableView*)tableView
  accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath
{
//  UIViewController* viewController = [[DetailViewController alloc] init];
//  [self.navigationController pushViewController:viewController animated:YES];
//  [viewController release];
}

@end

//
//  SampleForBeginUpdates.m
//
//  Created by ToKoRo on 2009-10-17.
//

#import "SampleForBeginUpdates.h"

@implementation SampleForBeginUpdates

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ =
    [[NSMutableArray alloc] initWithObjects:@"ITEM X1", @"ITEM 1", @"ITEM X2", @"ITEM 3", nil];

  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"일괄처리 개시"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(batchButtonDidPush:)] autorelease];
  self.navigationItem.rightBarButtonItem = barButton;
}

- (void)batchButtonDidPush:(id)sender {
  // 데이터 소스를 정리
  [dataSource_ setArray:[NSArray arrayWithObjects:@"ITEM 1", @"ITEM 2", @"ITEM 3", nil]];
  // 삭제할 셀 결정
  NSArray* forDeleting = [NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:0],
                                                   [NSIndexPath indexPathForRow:2 inSection:0],
                                                   nil];
  // 추가할 장소 결정	
  NSArray* forInserting = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:1 inSection:0]];

  [self.tableView beginUpdates];
  // ITEM X 의 것을 삭제한다
  [self.tableView deleteRowsAtIndexPaths:forDeleting withRowAnimation:UITableViewRowAnimationFade];
  // ITEM 2 를 삽입한다
  [self.tableView insertRowsAtIndexPaths:forInserting withRowAnimation:UITableViewRowAnimationFade];
  [self.tableView endUpdates];

  if ( [sender isKindOfClass:[UIBarButtonItem class]] ) {
    UIBarButtonItem* button = sender;
    button.enabled = NO;
  } 
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

@end

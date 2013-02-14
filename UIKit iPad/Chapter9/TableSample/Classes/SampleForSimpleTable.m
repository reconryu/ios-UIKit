//
//  SampleForSimpleTable.m
//
//  Created by ToKoRo on 2009-09-21.
//

#import "SampleForSimpleTable.h"

@implementation SampleForSimpleTable

- (void)dealloc {
  [dataSource_ release]; //< 화면 해제 시에 요소의 배열도 해제
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"SimpleTable";
  // 여기에 테이블에 표시할 구체적인 요소를 결정해 놓는다 (여기에서는 18개 셀)
  dataSource_ = [[NSArray alloc] initWithObjects:
                              @"ITEM 1", @"ITEM 2", @"ITEM 3",
                              @"ITEM 4", @"ITEM 5", @"ITEM 6",
                              @"ITEM 7", @"ITEM 8", @"ITEM 9",
                              @"ITEM 10", @"ITEM 11", @"ITEM 12",
                              @"ITEM 13", @"ITEM 14", @"ITEM 15",
                              @"ITEM 16", @"ITEM 17", @"ITEM 18",
							  @"ITEM 19", @"ITEM 20", @"ITEM 21",
				              @"ITEM 22", @"ITEM 23", @"ITEM 24",
                              nil ];
}

// 테이블의 행수 (이번은 단순하게 셀의 수)를 반환한다
- (NSInteger)tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section {
  return [dataSource_ count];
}

// 각 셀에 표시할 내용을 결정한다 (indexPath에서 지정된 장소의 셀을 만든다)
- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  // 퍼포먼스 향상을 위해서 셀은 재이용할 필요가 있다 
  static NSString* identifier = @"basis-cell";
  // 기본적으로는 같은 형식의 셀을 사용하기 위해서 그 셀을 재이용 한다 
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
	// 기초가 되는 셀이 아직 완성되어 있지 않다면 작성  
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  // 이 indexPath에 표시할 텍스트를 결정한다
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];
  return cell;
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
  NSString* message = [dataSource_ objectAtIndex:indexPath.row];
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = message;
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

@end

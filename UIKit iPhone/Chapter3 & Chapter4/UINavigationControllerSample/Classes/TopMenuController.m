//
//  TopMenuController.m
//
//  Created by ToKoRo on 2009-08-16.
//

#import "TopMenuController.h"

@implementation TopMenuController

- (void)dealloc {
  [items_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super initWithStyle:UITableViewStylePlain]) ) {
    self.title = @"최상위 메뉴";
    // 표시할 데이터를 작성
    items_ = [[NSMutableArray alloc] initWithObjects:
                  @"ViewController1",
                  @"ViewController2",
                  nil ];
  }
  return self;
}

#pragma mark ----- UITableViewDataSource Methods -----

- (NSInteger)tableView:(UITableView*)tableView
numberOfRowsInSection:(NSInteger)section {

  return [items_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath {

  // 이미 셀의 형이 등록되었는지 어떤지를 확인
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"simple-cell"];
  if ( !cell ) {
    // 셀의 형이 등록이 안되었으면 새롭게 등록한다.
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"simple-cell"] autorelease];
  } 
  // 셀의 라벨에 표시할 텍스트를 설정
  cell.textLabel.text = [items_ objectAtIndex:indexPath.row];
  return cell;
}

#pragma mark ----- UITableViewDelegate Methods -----

- (void)tableView:(UITableView*)tableView
didSelectRowAtIndexPath:(NSIndexPath*)indexPath {

  Class class = NSClassFromString( [items_ objectAtIndex:indexPath.row] );
  id viewController = [[[class alloc] init] autorelease];
  if ( viewController ) {
    [self.navigationController pushViewController:viewController animated:YES];
  } 
}

@end

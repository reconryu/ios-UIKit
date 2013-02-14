//
//  SampleForSearchBar.m
//
//  Created by ToKoRo on 2009-10-05.
//

#import "SampleForSearchBar.h"

@implementation SampleForSearchBar

- (void)dealloc {
  [searchBar_ release];
  [dataSource_ release];
  [dataBase_ release];
  [super dealloc];
}	

- (void)viewDidLoad {
  [super viewDidLoad];

  searchBar_ = [[UISearchBar alloc] init];
  searchBar_.frame = CGRectMake( 0, 0, self.tableView.bounds.size.width, 0 );
  searchBar_.delegate = self;
  searchBar_.barStyle = UIBarStyleBlack;
  //searchBar_.translucent = YES;
  [searchBar_ sizeToFit];
  self.tableView.tableHeaderView = searchBar_;

  dataBase_ = [[NSMutableArray alloc] initWithCapacity:64];
  dataSource_ = [[NSMutableArray alloc] initWithCapacity:64];
  for ( int i = 0; i < 64; ++i ){
    [dataBase_ addObject:[NSString stringWithFormat:@"%d", i]];
    [dataSource_ addObject:[NSString stringWithFormat:@"%d", i]];
  }
}

// 예를 들어 dataSource_를 데이터 소스를 관리하는 NSArray형의 인스턴스 변수로 해서
// dataBase_를 모든 데이터를 보관유지하는 NSArray형의 인스턴스 변수로 한다
- (void)searchBarSearchButtonClicked:(UISearchBar*)searchBar {
	[dataSource_ removeAllObjects];  //< 데이터 소스를 일단 모두 삭제한다
	for ( NSString* data in dataBase_ ) {
		if ( [data hasPrefix:searchBar.text] ) {
			[dataSource_ addObject:data];  //<　모든 데이터 중에서 검색 문자열로 시작할 것만 추가
		} 
	} 
	[self.tableView reloadData];  //<  테이블 갱신
	[searchBar resignFirstResponder];   //< 키보드를 비표시로 한다
}


#pragma mark UITableView methods

- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  return [dataSource_ count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  
  cell.textLabel.text = [dataSource_ objectAtIndex:indexPath.row];

  return cell;
}

@end

//
//  SampleForSearchDisplay.m
//
//  Created by ToKoRo on 2009-10-05.
//

#import "SampleForSearchDisplay.h"

#pragma mark ----- Item -----

@implementation Item

@synthesize weapon = weapon_;
@synthesize armor = armor_;
@synthesize name = name_;

+ (id)weaponWithName:(NSString*)name {
  Item* item = [[[Item alloc] init] autorelease];
  item.name = name;
  item.weapon = YES;
  return item;
}

+ (id)armorWithName:(NSString*)name {
  Item* item = [[[Item alloc] init] autorelease];
  item.name = name;
  item.armor = YES;
  return item;
}

- (NSComparisonResult)compare:(Item*)aItem {
  if ( aItem == self ) {
    return NSOrderedSame;
  } 
  return [self.name compare:[aItem name]];
}

@end

#pragma mark ----- SampleForSearchDisplay -----

@implementation SampleForSearchDisplay

- (void)dealloc {
  [dataSource_ release];
  [searchResult_ release];
  [searchDisplay_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"장비검색";

  UISearchBar* searchBar = [[[UISearchBar alloc] init] autorelease];
  searchBar.frame = CGRectMake( 0, 0, self.tableView.bounds.size.width, 0 );
  [searchBar sizeToFit];
  searchBar.scopeButtonTitles = [NSArray arrayWithObjects:@"모두", @"무기", @"방어구", nil];
  searchBar.showsScopeBar = YES;
  self.tableView.tableHeaderView = searchBar;

  // searchDisplay_를 UISearchDisplayController를 보관유지하는 인스턴스 변수로 한다	 
  searchDisplay_ =
    [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
  searchDisplay_.delegate = self;
  searchDisplay_.searchResultsDataSource = self;
  searchDisplay_.searchResultsDelegate = self;

  NSArray* weapons = [NSArray arrayWithObjects:
                       @"세라믹 양날검",
                       @"세라믹 칼",
                       @"세라믹 필러",
                       @"성스러운 자",
                       nil];
  NSArray* armors = [NSArray arrayWithObjects:
                       @"세라믹 갑옷",
                       @"세라믹 방패",
                       @"세라믹 투구",
                       @"마법의 망또",
                       @"크르비스 슈트",
                       nil];
  dataSource_ = [[NSMutableArray alloc] initWithCapacity:16];
  for ( id name in weapons ) {
    [dataSource_ addObject:[Item weaponWithName:name]];
  }
  for ( id name in armors ) {
    [dataSource_ addObject:[Item armorWithName:name]];
  }
  [dataSource_ sortUsingSelector:@selector(compare:)];

  searchResult_ = [[NSMutableArray alloc] initWithCapacity:dataSource_.count];
}

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller
  shouldReloadTableForSearchString:(NSString*)searchString
{
  // 검색 결과를 클리어
  [searchResult_ removeAllObjects];
  // 검색결과에 검색 문자열을 포함한 데이터만 추가한다
  for ( Item* item in dataSource_ ) {
	// 이 판단 로직은 데이터소스가 문자열인 경우의 예이다
	// 데이터소스의 형식에 따라서 최적의 판단 로직으로 바꿔 넣을 것  
    if ( NSNotFound != [item.name rangeOfString:searchString].location ) {
      [searchResult_ addObject:item];
    } 
  }
  return YES;
}

// * 주의
// 여기에서 데이터소스로서 사용하고 있는　Item클래스는 실제로는 존재하지 않는 클래스다
// Item클래스를 적절히 바꿔서 구현할 것

- (BOOL)searchDisplayController:(UISearchDisplayController*)controller
  shouldReloadTableForSearchScope:(NSInteger)searchOption
{
  // 일단 모든 데이터를 삭제
  [searchResult_ removeAllObjects];
  // 검색 문자열을 포함하는 동시에 일치하는 스코프의 데이터만을 추가한다
  NSString* searchString = controller.searchBar.text;
  // 데이터소스는 Item이라고 하는 오리지널 클래스에서 관리하고 있는 것으로 한다
  for ( Item* item in dataSource_ ) {
	// 우선 Item의 name프로퍼티에 검색문자열이 포함되어 있는가를 체크  
    if ( NSNotFound != [item.name rangeOfString:searchString].location ) {
      if ( 0 == searchOption ) {
		// 스코프가 [모두]라면 검색 문자열이 포함되는 모든 요소를 추가
        [searchResult_ addObject:item];
      } else if ( 1 == searchOption ) {
        if ( [item isWeapon] ) {
          [searchResult_ addObject:item];
        } 
      } else {
		// 선택한 스코프가 item의 종류와 일치하고 있다면 검새결과에 추가
		// 예를들어 [무기]라면 분류가 무기인 것만 추가한다  
        if ( [item isArmor] ) {
          [searchResult_ addObject:item];
        } 
      }
    }
  }
  return YES;
}

#pragma mark UITableView methods

// dataSource_를 모든 데이터를 보관유지하는 인스턴스 변수로 한다
// searchResult_를 검색결과를 보관유지하는 인스턴스 변수로 한다
- (NSInteger)tableView:(UITableView*)tableView
  numberOfRowsInSection:(NSInteger)section
{
  if ( tableView == self.searchDisplayController.searchResultsTableView ) {
    return [searchResult_ count];
  } else {
    return [dataSource_ count];
  }
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  // tableView와 UISearchDisplayController의 serahResultsTableView가 같다면 검색 결과표시
  if ( tableView == self.searchDisplayController.searchResultsTableView ) {
    cell.textLabel.text = [[searchResult_ objectAtIndex:indexPath.row] name];
  } else {
    cell.textLabel.text = [[dataSource_ objectAtIndex:indexPath.row] name];
  }
  return cell;
}

@end

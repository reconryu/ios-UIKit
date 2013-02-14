//
//  SampleForSectionTable.m
//
//  Created by ToKoRo on 2009-09-22.
//

#import "SampleForSectionTable.h"

@implementation SampleForSectionTable

- (void)dealloc {
  [keys_ release];
  [dataSource_ release];
  [super dealloc];
}

- (id)init {
  if ( (self = [super init]) ) {
    self.title = @"SectionTable";    // 타이틀 추가 (없어도 영향은 없다)
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 표시할 데이터를 작성
  keys_ = [[NSArray alloc] initWithObjects:@"포유류", @"파충류", @"양서류", @"어류", nil];
  // 각 섹션에 들어가는 데이터 작성	
  NSArray* object1 = [NSArray arrayWithObjects:@"Monkey", @"Dog", @"Lion", @"Elephant", nil];
  NSArray* object2 = [NSArray arrayWithObjects:@"Snake", @"Gecko", nil];
  NSArray* object3 = [NSArray arrayWithObjects:@"Frog", @"Newts", nil];
  NSArray* object4 = [NSArray arrayWithObjects:@"Shark", @"Salmon", nil];
  NSArray* objects = [NSArray arrayWithObjects:object1, object2, object3, object4, nil];
  // 섹션명과 데이터를 맞춘다	
  dataSource_ = [[NSDictionary alloc] initWithObjects:objects forKeys:keys_];
}

// 각 섹션의 항목 수를 반환한다
- (NSInteger)tableView:(UITableView*)table numberOfRowsInSection:(NSInteger)section {
  id key = [keys_ objectAtIndex:section];
  return [[dataSource_ objectForKey:key] count];
}

// IndexPath에서 지정된 곳의 셀을 만든다
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
  // 먼저 section번째의 섹션명을 추출한다
  id key = [keys_ objectAtIndex:indexPath.section];
  // 그 섹션명의 섹션에 있는 항목 중의 row번째 데이터를 반환한다	
  NSString* text = [[dataSource_ objectForKey:key] objectAtIndex:indexPath.row];
  cell.textLabel.text = text;
  return cell;
}

// 섹션 수를 반환한다
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return [keys_ count];
}

// 섹션 번째의 섹션명을 반환한다
- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  return [keys_ objectAtIndex:section];
}

//- (NSString*)tableView:(UITableView*)tableView titleForFooterInSection:(NSInteger)section {
//  return [keys_ objectAtIndex:section];
//}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  return keys_;
}

@end

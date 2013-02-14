//
//  SampleForLocalizedIndexedCollation.m
//
//  Created by ToKoRo on 2009-10-18.
//

#import "SampleForLocalizedIndexedCollation.h"

#pragma mark ----- Character -----

@implementation Character

@synthesize name = name_;
@synthesize job = job_;

@end

@implementation SampleForLocalizedIndexedCollation

@synthesize dataSource = dataSource_;

- (void)viewDidLoad {
  [super viewDidLoad];

  NSMutableArray* dataSourceTemp = [NSMutableArray arrayWithCapacity:52];
  for ( int i = 0; i < 50; ++i ){
    Character* dummy = [[Character alloc] init];
    dummy.name = ( i % 2 ) ? @"Dummy" : @"더미";
    dummy.job = @"아르바이트";
    [dataSourceTemp addObject:dummy];
    [dummy release];
  }
	
  Character* character1 = [[Character alloc] init];
  character1.name = @"김마법";
  character1.job = @"마도사";
  [dataSourceTemp addObject:character1];
  [character1 release];
  Character* character2 = [[Character alloc] init];
  character2.name = @"이강산";
  character2.job = @"백수";
  [dataSourceTemp addObject:character2];
  [character2 release];

  UILocalizedIndexedCollation* theCollation = [UILocalizedIndexedCollation currentCollation];
	
  // 섹션의 수만큼 빈 NSMutableArray를 갖는 배열을 작성
  NSInteger sectionCount = [[theCollation sectionTitles] count];
  NSMutableArray* sectionArrays = [NSMutableArray arrayWithCapacity:sectionCount];
  for ( int i = 0; i <= sectionCount; ++i ) {
    [sectionArrays addObject:[NSMutableArray arrayWithCapacity:1]];
  }
	
  // 데이터를 일단 위에서 만든 배열에 섹션마다 넣는다
  for ( Character* character in dataSourceTemp ) {
    NSInteger sect = [theCollation sectionForObject:character
                            collationStringSelector:@selector(name)];
    [[sectionArrays objectAtIndex:sect] addObject:character];
  }
	
  // 섹션 마다 데이터를 정리한 후에 데이터 관리용 배열에 추가해 나간다
  self.dataSource = [NSMutableArray arrayWithCapacity:sectionCount];
  for ( NSMutableArray* sectionArray in sectionArrays ) {
    NSArray* sortedSection = [theCollation sortedArrayFromArray:sectionArray
                                        collationStringSelector:@selector(name)];
    [self.dataSource addObject:sortedSection];
  }
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView*)tableView {
  return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
  if ( [[self.dataSource objectAtIndex:section] count] < 1 ) {
    return nil;
  }
  return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView*)table
  sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index
{
  return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
  return [self.dataSource count];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
  return [[self.dataSource objectAtIndex:section] count];
}

- (UITableViewCell*)tableView:(UITableView*)tableView
  cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
  static NSString* identifier = @"ㄷ";
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
  if ( nil == cell ) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
    [cell autorelease];
  }
  Character* character =
    [[self.dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
  cell.textLabel.text = character.name;
  return cell;
}

@end

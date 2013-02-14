//
//  SampleForBookmarkButton.m
//
//  Created by ToKoRo on 2009-10-06.
//

#import "SampleForBookmarkButton.h"

@implementation SampleForBookmarkButton

- (void)viewDidLoad {
  [super viewDidLoad];
  // 북마크 버튼 표시
  searchBar_.showsBookmarkButton = YES;
}

// 북마크 버튼이 탭되었을 때에 북마크 일람을 표시할 모달 화면을 표시
// BookmarkDialog　클래스가 그 북마크 일람 화면이라고 가정한다
- (void)searchBarBookmarkButtonClicked:(UISearchBar*)searchBar {
  id rootViewController = [[BookmarkDialog alloc] initWithParent:self];
  id navi = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  [rootViewController release];
  [self presentModalViewController:navi animated:YES];
  [navi release];
}

- (void)setCurrentText:(NSString*)text {
  searchBar_.text = text;
  [self searchBarSearchButtonClicked:searchBar_];
}

@end

#pragma mark ----- BookmarkDialog -----

@implementation BookmarkDialog

- (void)dealloc {
  [dataSource_ release];
  [super dealloc];
}

- (id)initWithParent:(UIViewController*)parent {
  if ( (self = [super init]) ) {
    parent_ = parent;    
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  dataSource_ = [[NSArray alloc] initWithObjects:@"11",
                                                 @"22",
                                                 @"33",
                                                 nil ];
  self.title = @"Bookmarks";
  UIBarButtonItem* barButton =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(doneDidPush)] autorelease];
  self.navigationItem.rightBarButtonItem = barButton;
}

- (void)doneDidPush {
  [self dismissModalViewControllerAnimated:YES];
}

- (void)tableView:(UITableView*)tableView
  didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
  [parent_ setCurrentText:[dataSource_ objectAtIndex:indexPath.row]];
  [self dismissModalViewControllerAnimated:YES];
}

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

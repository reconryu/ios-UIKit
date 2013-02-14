//
//  SampleForRealTimeSearch.m
//
//  Created by ToKoRo on 2009-10-06.
//

#import "SampleForRealTimeSearch.h"

@implementation SampleForRealTimeSearch

- (void)viewDidLoad {
  [super viewDidLoad];

  searchBar_.keyboardType = UIKeyboardTypeNumberPad;
  searchBar_.showsCancelButton = YES;
}

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)searchText {
  if ( 0 == searchText.length ) {
	 // 검색문자열이 없어졌을 경우 모든 데이터를 재표시한다   
    [dataSource_ release];
    dataSource_ = [[NSMutableArray alloc] initWithArray:dataBase_];
    [self.tableView reloadData];
  } else {
	 // 검색문자열이 있는 경우는 전 항의 검색 구현과 같다  
    [dataSource_ removeAllObjects];
    for ( NSString* data in dataBase_ ) {
      if ( [data hasPrefix:searchBar.text] ) {
        [dataSource_ addObject:data];
      } 
    }
    [self.tableView reloadData];
  }
  // 리얼타임 검색의 경우는 키보드를 비표시로 하지 않을 것
}

- (void)searchBarCancelButtonClicked:(UISearchBar*)searchBar {
  searchBar.text = @""; 
  [searchBar resignFirstResponder];   //< 키보드 비표시로
}

@end

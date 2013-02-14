//
//  SampleForPrompt.m
//
//  Created by ToKoRo on 2009-10-06.
//

#import "SampleForPrompt.h"

@implementation SampleForPrompt

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UISearchBar* searchBar = [[[UISearchBar alloc] init] autorelease];
  searchBar.frame = CGRectMake( 0, 0, 768, 70 );

  searchBar.prompt = @"세계의 숙박업소 검색";
  searchBar.placeholder = @"숙박업소 이름의 일부를 입력해 주십시오";

  [self.view addSubview:searchBar];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

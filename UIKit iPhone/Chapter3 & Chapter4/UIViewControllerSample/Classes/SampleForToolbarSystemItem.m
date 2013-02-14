//
//  SampleForToolbarSystemItem.m
//
//  Created by ToKoRo on 2009-08-26.
//

#import "SampleForToolbarSystemItem.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForToolbarSystemItem ()
- (UIBarButtonItem*)barButtonSystemItem:(UIBarButtonSystemItem)systemItem;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForToolbarSystemItem

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"UIBarButtonSystemItem 일람";

  [self setToolbarItems:[NSArray arrayWithObjects:
          [self barButtonSystemItem:UIBarButtonSystemItemDone],
          [self barButtonSystemItem:UIBarButtonSystemItemCancel],
          [self barButtonSystemItem:UIBarButtonSystemItemEdit],
          [self barButtonSystemItem:UIBarButtonSystemItemSave],
          [self barButtonSystemItem:UIBarButtonSystemItemAdd],
          [self barButtonSystemItem:UIBarButtonSystemItemCompose],
          [self barButtonSystemItem:UIBarButtonSystemItemReply],
          [self barButtonSystemItem:UIBarButtonSystemItemAction],
          [self barButtonSystemItem:UIBarButtonSystemItemOrganize],
          [self barButtonSystemItem:UIBarButtonSystemItemBookmarks],
          [self barButtonSystemItem:UIBarButtonSystemItemSearch],
          [self barButtonSystemItem:UIBarButtonSystemItemRefresh],
          [self barButtonSystemItem:UIBarButtonSystemItemStop],
          [self barButtonSystemItem:UIBarButtonSystemItemCamera],
          [self barButtonSystemItem:UIBarButtonSystemItemTrash],
          [self barButtonSystemItem:UIBarButtonSystemItemPlay],
          [self barButtonSystemItem:UIBarButtonSystemItemPause],
          [self barButtonSystemItem:UIBarButtonSystemItemRewind],
          [self barButtonSystemItem:UIBarButtonSystemItemFastForward],
          [self barButtonSystemItem:UIBarButtonSystemItemUndo],
          [self barButtonSystemItem:UIBarButtonSystemItemRedo],
          nil]];

  // 라벨을 추가
  UILabel* label = [[[UILabel alloc] init] autorelease];
  label.frame = self.view.bounds;
  label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.numberOfLines = 3;
  label.textAlignment = UITextAlignmentCenter;
  label.text = @"화면을 탭하면 툴바의 버튼이 왼쪽으로 이동해 갑니다.";
  [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setToolbarHidden:NO animated:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark ----- Responder -----

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  // 이동 후에 툴바 버튼을 넣을 배열을 준비
  NSMutableArray* newItems =
  [[[NSMutableArray alloc] initWithCapacity:self.toolbarItems.count] autorelease];
  // 우선, 왼쪽에서 2번째 이후의 버튼을 추출해 추가
  NSRange range = NSMakeRange( 1, self.toolbarItems.count - 1 );
  [newItems addObjectsFromArray:[self.toolbarItems subarrayWithRange:range]];
  // 다음에, 왼쪽 끝의 버튼을 마지막으로 추가
  [newItems addObject:[self.toolbarItems objectAtIndex:0]];
  // 순서를 바꾼 툴바 버튼을 툴바로 설정
  [self setToolbarItems:newItems animated:YES];
}

#pragma mark ----- Private Methods -----

- (UIBarButtonItem*)barButtonSystemItem:(UIBarButtonSystemItem)systemItem {
  UIBarButtonItem* button =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem
                                                   target:nil
                                                   action:nil] autorelease];
  return button;
}

@end

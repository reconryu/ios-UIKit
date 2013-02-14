//
//  SampleForActionSheet.m
//
//  Created by ToKoRo on 2009-09-15.
//

#import "SampleForActionSheet.h"

@implementation SampleForActionSheet

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  // 툴바를 확실하게 비표시로 한다
  [self.navigationController setToolbarHidden:YES animated:NO];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"액션 시트";
  // 네비게이션 바에 액션 버튼을 추가 
  UIBarButtonItem* button =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                  target:self
                                                  action:@selector(buttonDidPush)];
  self.navigationItem.rightBarButtonItem = button;
  [button release];
}

- (void)buttonDidPush {
  ///*
  // iPad상에서 실행 시에는 취소 버튼이 나오지 않는다 (이것은 애플사의 정책이다).
  UIActionSheet* sheet = [[[UIActionSheet alloc] init] autorelease];
 
  sheet.delegate = self;
  [sheet addButtonWithTitle:@"액션1"];
  [sheet addButtonWithTitle:@"액션2"];
  //[sheet addButtonWithTitle:@"취소"];
  //sheet.cancelButtonIndex = 2;
	sheet.actionSheetStyle = UIActionSheetStyleAutomatic;
  [sheet showInView:self.view];
  //*/
	
  /*어느 쪽으로 해도 같음
  UIActionSheet* sheet = [[[UIActionSheet alloc] initWithTitle:nil
                                                      delegate:self
                                             cancelButtonTitle:@"취소"
                                        destructiveButtonTitle:nil
                                             otherButtonTitles:@"액션1", @"액션2", nil] autorelease];
  //sheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
  [sheet showInView:self.view];
  //*/

}

- (void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  if ( buttonIndex == actionSheet.cancelButtonIndex ) {
    NSLog( @"pushed Cancel button." );
  }
}

@end

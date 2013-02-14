//
//  SampleForUniqueIdentifier.m
//
//  Created by ToKoRo on 2009-09-24.
//

#import "SampleForUniqueIdentifier.h"

@implementation SampleForUniqueIdentifier

- (void)dealloc {
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  UILabel* label = [[[UILabel alloc] init] autorelease];	
  label.frame = self.view.bounds;
  label.autoresizingMask =
    UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  label.numberOfLines = 4;
  NSString* identifier = [UIDevice currentDevice].uniqueIdentifier;
  label.text = [NSString stringWithFormat:@"uniqueIdentifier: %@", identifier];
  label.font = [UIFont systemFontOfSize:36];
  [self.view addSubview:label];
}

- (void)copy:(id)sender {
  // 단말 식별자를 페이스트보드에 보존
  // 이것을 나중에 메일 어플리나 메모장에 페이스트할 수 있다.
  [UIPasteboard generalPasteboard].string = [UIDevice currentDevice].uniqueIdentifier;
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  if ( [self becomeFirstResponder] ) {
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    UIMenuController* menu = [UIMenuController sharedMenuController];
    CGRect minRect;
    minRect.origin = point;
    [menu setTargetRect:minRect inView:self.view];
    [menu setMenuVisible:YES animated:YES];
  } 
}

// 퍼스트레스폰더가 될 수 없으면 편집 메뉴는 표시할 수 없다
- (BOOL)canBecomeFirstResponder {
  return YES;
}

// copy 커맨드를 이용 가능으로 한다
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
  if ( @selector(copy:) == action ) {
    return YES;
  }
  return [super canPerformAction:action withSender:sender];
}

@end

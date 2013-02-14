//
//  SampleForWorkingWithTheSelection.m
//
//  Created by ToKoRo on 2009-09-20.
//

#import "SampleForWorkingWithTheSelection.h"

static const CGFloat kKeyboardHeight = 216.0;

@implementation SampleForWorkingWithTheSelection

- (void)dealloc {
  [textView_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // UITextView 붙이기
  textView_ = [[UITextView alloc] init];
  textView_.frame = self.view.bounds;
  textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView_.text = @"이 텍스트는 편집 가능합니다.";
  [self.view addSubview:textView_];

  // 툴바에 버튼을 추가
  UIBarButtonItem* hasTextButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"hasText"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(hasTextDidPush)] autorelease];
  UIBarButtonItem* selectionButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"selection"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(selectionDidPush)] autorelease];
  UIBarButtonItem* alignmentButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"alignment"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(alignmentDidPush)] autorelease];
  UIBarButtonItem* scrollButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"top"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(scrollDidPush)] autorelease];
  NSArray* buttons = [NSArray arrayWithObjects:hasTextButton, selectionButton, alignmentButton, scrollButton, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  // 툴바의 위치 조정
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  textView_.frame =
    CGRectMake( 0, 0, self.view.bounds.size.width, self.view.bounds.size.height - kKeyboardHeight );
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height - kKeyboardHeight;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
  [textView_ becomeFirstResponder]; //< 화면 표시 시에 키보드 표시 
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];

  // 툴바를 원래로 되돌린다
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  textView_.frame = self.view.bounds;
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y = self.view.window.bounds.size.height - toolbarFrame.size.height;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
  [textView_ resignFirstResponder]; //< 화면 비표시 시에 키보드를 감춘다
}

- (void)hasTextDidPush {
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  if ( textView_.hasText ) {
    alert.message = @"textView_.hasText = YES";
  } else {
    alert.message = @"textView_.hasText = NO";
  }
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

- (void)selectionDidPush {
  UIAlertView* alert = [[[UIAlertView alloc] init] autorelease];
  alert.message = [NSString stringWithFormat:@"location = %d, length = %d",
                    textView_.selectedRange.location, textView_.selectedRange.length];
  [alert addButtonWithTitle:@"OK"];
  [alert show];
}

- (void)alignmentDidPush {
  textView_.editable = NO;
  if ( UITextAlignmentRight < ++textView_.textAlignment ) {
    textView_.textAlignment = UITextAlignmentLeft;
  } 
  textView_.editable = YES;
}

- (void)scrollDidPush {
  // NSRange scrollRange = NSMakeRange( 0, 1 );
  [textView_ scrollRangeToVisible:NSMakeRange( 0, 1 )];
}

@end

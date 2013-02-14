//
//  SampleForTextViewObserving.m
//
//  Created by ToKoRo on 2009-09-20.
//

#import "SampleForTextViewObserving.h"

@implementation SampleForTextViewObserving

- (void)dealloc {
  [textView_ release];  
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // UITextView 붙이기
  textView_ = [[UITextView alloc] init];
  textView_.frame = self.view.bounds;
  textView_.delegate = self;
  textView_.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  textView_.text = @"이 텍스트는 편집 가능합니다.";
  [self.view addSubview:textView_];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  [self textViewDidEndEditing:textView_]; //< 화면 표시 시에는 편집 모드로 한다
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  [textView_ resignFirstResponder]; //< 화면 천이 시에는 비표시 모드로 한다
}

- (BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text {
  NSLog( @"shouldChangeTextInRange %@", text );
  if ( [text isEqualToString:@"a"] ) {
    return NO; //< a만 입력할 수 없게 된다
  } 
  return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView*)textView {
  NSLog( @"textViewShouldBeginEditing" );
  return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView*)textView {
  NSLog( @"textViewShouldEndEditing" );
  return YES;
}

- (void)textViewDidChangeSelection:(UITextView*)textView {
  NSLog( @"textViewDidChangeSelection" );
}

- (void)textViewDidChange:(UITextView*)textView {
  NSLog( @"textViewDidChange" );
}

- (void)textViewDidBeginEditing:(UITextView*)textView {
  NSLog( @"textViewDidBeginEditing" );
  static const CGFloat kKeyboardHeight = 216.0;

  // 버튼을[편집]으로
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                   target:self
                                                   action:@selector(doneDidPush)] autorelease];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  // UITextView을 작게 해서 키보드에 감춰지지 않도록 한다
  CGRect textViewFrame = textView.frame;
  textViewFrame.size.height = self.view.bounds.size.height - kKeyboardHeight;
  textView.frame = textViewFrame;
  // 툴바의 위치를 위로 올린다
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height - kKeyboardHeight;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
}

- (void)textViewDidEndEditing:(UITextView*)textView {
  NSLog( @"textViewDidEndEditing" );

  // 버튼을[완료]로
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                   target:self
                                                   action:@selector(editDidPush)] autorelease];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.3];
  // UITextView의 크기를 원래로 되돌린다
  textView.frame = self.view.bounds;
  // 툴바의 위치를 원래로 되돌린다
  CGRect toolbarFrame = self.navigationController.toolbar.frame;
  toolbarFrame.origin.y =
    self.view.window.bounds.size.height - toolbarFrame.size.height;
  self.navigationController.toolbar.frame = toolbarFrame;
  [UIView commitAnimations];
}

- (void)editDidPush {
  [textView_ becomeFirstResponder];
}

- (void)doneDidPush {
  [textView_ resignFirstResponder];
}

@end

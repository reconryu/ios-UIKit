//
//  SampleForKeyboard.m
//
//  Created by ToKoRo on 2009-09-20.
//

#import "SampleForKeyboard.h"

@implementation SampleForKeyboard

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
  textView_.text = @"이 텍스틑 편집 가능합니다.";
  [self.view addSubview:textView_];

  // 툴바에 버튼을 추가
  UIBarButtonItem* typeButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"type"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(typeDidPush)] autorelease];
  UIBarButtonItem* returnTypeButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"return"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(returnTypeDidPush)] autorelease];
  UIBarButtonItem* capitalizationButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"capital"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(capitalizationDidPush)] autorelease];
  UIBarButtonItem* correctionButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"correct"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(correctionDidPush)] autorelease];
  UIBarButtonItem* enableReturnKeyButton =
    [[[UIBarButtonItem alloc] initWithTitle:@"enable"
                                      style:UIBarButtonItemStyleBordered
                                     target:self
                                     action:@selector(enablesReturnKeyDidPush)] autorelease];
  NSArray* buttons =
    [NSArray arrayWithObjects:typeButton, returnTypeButton, capitalizationButton, correctionButton, enableReturnKeyButton, nil];
  [self setToolbarItems:buttons animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];

  // 툴바 위치를 조정
  static const CGFloat kKeyboardHeight = 216.0;
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

- (void)typeDidPush {
  textView_.editable = NO;
  if ( UIKeyboardTypeEmailAddress < ++textView_.keyboardType ) {
    textView_.keyboardType = UIKeyboardTypeDefault;
  } 
  switch ( textView_.keyboardType ) {
    case UIKeyboardTypeDefault: textView_.text = @"UIKeyboardTypeDefault"; break;
    case UIKeyboardTypeASCIICapable: textView_.text = @"UIKeyboardTypeASCIICapable"; break;
    case UIKeyboardTypeNumbersAndPunctuation: textView_.text = @"UIKeyboardTypeNumbersAndPunctuation"; break;
    case UIKeyboardTypeURL: textView_.text = @"UIKeyboardTypeURL"; break;
    case UIKeyboardTypeNumberPad: textView_.text = @"UIKeyboardTypeNumberPad"; break;
    case UIKeyboardTypePhonePad: textView_.text = @"UIKeyboardTypePhonePad"; break;
    case UIKeyboardTypeNamePhonePad: textView_.text = @"UIKeyboardTypeNamePhonePad"; break;
    case UIKeyboardTypeEmailAddress: textView_.text = @"UIKeyboardTypeEmailAddress"; break;
    defalut: break;
  }
  textView_.editable = YES;
}

- (void)returnTypeDidPush {
  textView_.editable = NO;
  if ( UIReturnKeyEmergencyCall < ++textView_.returnKeyType ) {
    textView_.returnKeyType = UIReturnKeyDefault;
  } 
  switch ( textView_.returnKeyType ) {
    case UIReturnKeyDefault: textView_.text = @"UIReturnKeyDefault"; break;
    case UIReturnKeyGo: textView_.text = @"UIReturnKeyGo"; break;
    case UIReturnKeyGoogle: textView_.text = @"UIReturnKeyGoogle"; break;
    case UIReturnKeyJoin: textView_.text = @"UIReturnKeyJoin"; break;
    case UIReturnKeyRoute: textView_.text = @"UIReturnKeyRoute"; break;
    case UIReturnKeySearch: textView_.text = @"UIReturnKeySearch"; break;
	case UIReturnKeySend: textView_.text = @"UIReturnKeySend"; break;	  
    case UIReturnKeyYahoo: textView_.text = @"UIReturnKeyYahoo"; break;
	case UIReturnKeyDone: textView_.text = @"UIReturnKeyDone"; break;
    case UIReturnKeyEmergencyCall: textView_.text = @"UIReturnKeyEmergencyCall"; break;
    defalut: break;
  }
  textView_.editable = YES;
}

- (void)capitalizationDidPush {
  textView_.editable = NO;
  if ( UITextAutocapitalizationTypeAllCharacters < ++textView_.autocapitalizationType ) {
    textView_.autocapitalizationType = UITextAutocapitalizationTypeNone;
  } 
  switch ( textView_.autocapitalizationType ) {
    case UITextAutocapitalizationTypeNone: textView_.text = @"UITextAutocapitalizationTypeNone"; break;
    case UITextAutocapitalizationTypeWords: textView_.text = @"UITextAutocapitalizationTypeWords"; break;
    case UITextAutocapitalizationTypeSentences: textView_.text = @"UITextAutocapitalizationTypeSentences"; break;
    case UITextAutocapitalizationTypeAllCharacters: textView_.text = @"UITextAutocapitalizationTypeAllCharacters"; break;
    defalut: break;
  }
  textView_.editable = YES;
}

- (void)correctionDidPush {
  textView_.editable = NO;
  if ( UITextAutocorrectionTypeYes < ++textView_.autocorrectionType ) {
    textView_.autocorrectionType = UITextAutocorrectionTypeDefault;
  } 
  switch ( textView_.autocorrectionType ) {
    case UITextAutocorrectionTypeDefault: textView_.text = @"UITextAutocorrectionTypeDefault"; break;
    case UITextAutocorrectionTypeNo: textView_.text = @"UITextAutocorrectionTypeNo"; break;
    case UITextAutocorrectionTypeYes: textView_.text = @"UITextAutocorrectionTypeYes"; break;
    defalut: break;
  }
  textView_.editable = YES;
}

- (void)enablesReturnKeyDidPush {
  textView_.editable = NO;
  textView_.enablesReturnKeyAutomatically = !textView_.enablesReturnKeyAutomatically;
 
  if ( textView_.enablesReturnKeyAutomatically ) {
    textView_.text = @"enablesReturnKeyAutomatically = YES";
  } else {
    textView_.text = @"enablesReturnKeyAutomatically = NO";
  }
  textView_.editable = YES;
}

@end

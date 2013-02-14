//
//  SampleForSubviews.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForSubviews.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForSubviews ()
- (void)button11DidPush:(id)sender;
- (void)button111DidPush:(id)sender;
- (void)button112DidPush:(id)sender;
- (void)button1121DidPush:(id)sender;
- (void)button1122DidPush:(id)sender;
- (void)alertMessage:(UIButton*)button;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForSubviews

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 1-1버튼을 추가
  UIButton* button11 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button11.frame = CGRectMake( 10, 10, 300, 300 );
  [button11 setTitle:@"1-1" forState:UIControlStateNormal];
  [button11 addTarget:self
               action:@selector(button11DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button11];

  // 1-1-1버튼을 추가
  UIButton* button111 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button111.frame = CGRectMake( 20, 20, 260, 100 );
  [button111 setTitle:@"1-1-1" forState:UIControlStateNormal];
  [button111 addTarget:self
                action:@selector(button111DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button11 addSubview:button111];

  // 1-1-2버튼을 추가
  UIButton* button112 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button112.frame = CGRectMake( 20, 180, 260, 100 );
  [button112 setTitle:@"1-1-2" forState:UIControlStateNormal];
  [button112 addTarget:self
                action:@selector(button112DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button11 addSubview:button112];

  // 1-1-2-1버튼을 추가
  UIButton* button1121 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button1121.frame = CGRectMake( 10, 10, 95, 80 );
  [button1121 setTitle:@"1-1-2-1" forState:UIControlStateNormal];
  [button1121 addTarget:self
                 action:@selector(button1121DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button112 addSubview:button1121];

  // 1-1-2-2버튼을 추가
  UIButton* button1122 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button1122.frame = CGRectMake( 155, 10, 95, 80 );
  [button1122 setTitle:@"1-1-2-2" forState:UIControlStateNormal];
  [button1122 addTarget:self
                 action:@selector(button1122DidPush:)
      forControlEvents:UIControlEventTouchUpInside];
  [button112 addSubview:button1122];
}

#pragma mark ----- Private Methods -----

- (void)button11DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button111DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button112DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button1121DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)button1122DidPush:(id)sender {
  [self alertMessage:sender];
}

- (void)alertMessage:(UIButton*)button {

  NSString* title = [NSString stringWithFormat:@"self = %@", button.titleLabel.text];
  NSString* superViewName;
  if ( [button.superview isKindOfClass:[UIButton class]] ) {
    superViewName = ((UIButton*)button.superview).titleLabel.text;
  } else {
    superViewName = @"UIViewController";
  }
  NSMutableString* subviews = [[[NSMutableString alloc] initWithCapacity:64] autorelease];
  [subviews setString:@""];
  for ( id view in button.subviews ) {
    NSString* addString;
    if ( [view isKindOfClass:[UIButton class]] ) {
      addString = ((UIButton*)view).titleLabel.text;
    } else if ( [view isKindOfClass:[UILabel class]] ) {
      addString = ((UILabel*)view).text;
    } else {
      addString = [view description];
    }
    if ( [subviews length] > 0 ) {
      [subviews appendString:@", "];
    }
    [subviews appendString:addString];
  }
  NSString* message = [NSString stringWithFormat:@"superview = %@\r\nsubviews = %@", superViewName, subviews];

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:title
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

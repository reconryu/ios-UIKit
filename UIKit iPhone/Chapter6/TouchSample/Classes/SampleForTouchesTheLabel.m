//
//  SampleForTouchesTheLabel.m
//
//  Created by ToKoRo on 2009-08-31.
//

#import "SampleForTouchesTheLabel.h"

#pragma mark ----- TouchableLabel -----

// UILabel 서브클래스를 정의
@interface TouchableLabel : UILabel
@end 

// touchesBegan:withEvent:만 포함한다.
@implementation TouchableLabel

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a label!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end 

#pragma mark ----- SampleForTouchesTheLabel -----

@implementation SampleForTouchesTheLabel

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];

  // 새롭게 만든 새 라벨을 적당한 위치에 추가한다.
  TouchableLabel* label = [[[TouchableLabel alloc] init] autorelease];
  label.frame = CGRectMake( 60, 100, 200, 50 );
  label.text = @"Touch me!";
  label.textAlignment = UITextAlignmentCenter;
  label.backgroundColor = [UIColor grayColor];
  // userInteractionEnabled 프로퍼티는 반드시 YES로 한다.
  // UILabel은 이것이 기본으로 NO로 된다.
  label.userInteractionEnabled = YES;
  [self.view addSubview:label];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
                                                   message:@"I'm a viewController!"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil] autorelease];
  [alert show];
}

@end

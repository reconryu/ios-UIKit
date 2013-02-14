//
//  SampleForAddView.m
//
//  Created by ToKoRo on 2009-09-29.
//

#import "SampleForAddView.h"

@implementation SampleForAddView

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  UIImage* imageForLeft = [UIImage imageNamed:@"leftDog.png"];
  UIImageView* imageViewForLeft = [[[UIImageView alloc] initWithImage:imageForLeft] autorelease];
  UIImage* imageForRight = [UIImage imageNamed:@"rightDog.png"];
  UIImageView* imageViewForRight = [[[UIImageView alloc] initWithImage:imageForRight] autorelease];

  UITextField* textField1 = [[[UITextField alloc] init] autorelease];;
  textField1.borderStyle = UITextBorderStyleRoundedRect;
  textField1.frame = CGRectMake( 20, 30, 280, 50 );
  textField1.text = @"항상 좌우에 화상 표시";
  textField1.textAlignment = UITextAlignmentCenter;
  textField1.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  textField1.leftView = imageViewForLeft;    //< 필드 좌측에 UIImageView를 추가
  textField1.rightView = imageViewForRight;  //< 필드 우측에 UIImageView를 추가
  textField1.leftViewMode = UITextFieldViewModeAlways;  //< 좌측에 UIView는 항상 표시
  textField1.rightViewMode = UITextFieldViewModeAlways; //< 우측에 UIView는 항상 표시
  [self.view addSubview:textField1];

  UITextField* textField2 = [[[UITextField alloc] init] autorelease];;
  textField2.borderStyle = UITextBorderStyleRoundedRect;
  textField2.frame = CGRectMake( 20, 100, 280, 50 );
  textField2.text = @"비편집 시 오른쪽에 상세 버튼 표시";
  textField2.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
  UIButton* button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
  textField2.rightView = button;   // 필드의 우측에 상세 버튼을 추가
  textField2.rightViewMode = UITextFieldViewModeUnlessEditing;   // 비편집 시에만 편집
  [self.view addSubview:textField2];
}

@end

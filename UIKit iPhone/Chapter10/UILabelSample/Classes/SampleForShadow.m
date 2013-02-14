//
//  SampleForShadow.m
//
//  Created by ToKoRo on 2009-08-24.
//

#import "SampleForShadow.h"

@implementation SampleForShadow

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"shadowOffset";

  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label0 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 10, 320, 40 )] autorelease];
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 60, 320, 40 )] autorelease];
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 110, 320, 40 )] autorelease];
  UILabel* label3 = [[[UILabel alloc] initWithFrame:CGRectMake( 0, 160, 320, 40 )] autorelease];

  label0.textAlignment = UITextAlignmentCenter;
  label1.textAlignment = UITextAlignmentCenter;
  label2.textAlignment = UITextAlignmentCenter;
  label3.textAlignment = UITextAlignmentCenter;

  // 텍스트에 회색 그림자를 붙인다
  label1.shadowColor = [UIColor grayColor];
  label2.shadowColor = [UIColor grayColor];
  label3.shadowColor = [UIColor grayColor];
  // 텍스트로부터 오른쪽 1픽셀, 아래 1픽셀 떨어진 위치에 그림자를 표시
  label2.shadowOffset = CGSizeMake( 1, 1 );
  label3.shadowOffset = CGSizeMake( 3, 0 );
  	
  label0.text = @"그림자 없음";
  label1.text = @"디폴트 shadowOffset";
  label2.text = @"shadowOffset = CGSizeMake( 1, 1 )";
  label3.text = @"shadowOffset = CGSizeMake( 3, 0 )";

  [self.view addSubview:label0];
  [self.view addSubview:label1];
  [self.view addSubview:label2];
  [self.view addSubview:label3];
}

@end

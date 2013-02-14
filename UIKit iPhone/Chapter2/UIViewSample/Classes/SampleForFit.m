//
//  SampleForFit.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForFit.h"

@implementation SampleForFit

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 짧은 라벨을 추가
  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  label1.backgroundColor = [UIColor blueColor];
  label1.textColor = [UIColor whiteColor];
  label1.text = @"짧은 문자열";
  [label1 sizeToFit];
  [self.view addSubview:label1];

  // 긴 라벨을 추가
  UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  label2.backgroundColor = [UIColor blueColor];
  label2.textColor = [UIColor whiteColor];
  label2.text = @"긴ーーーーーーーーーー문자열";
  [label2 sizeToFit];
  CGPoint newPoint = label2.center;
  newPoint.y += 50;
  label2.center = newPoint;
  [self.view addSubview:label2];

  // DoubleLabel을 추가
  DoubleLabel* doubleLabel = [[[DoubleLabel alloc] init] autorelease];
  doubleLabel.frame = CGRectMake( 0, 100, 320, 200 );
  [doubleLabel sizeToFit];
  [self.view addSubview:doubleLabel];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

@implementation DoubleLabel

- (void)dealloc {
  [label1_ release]; 
  [label2_ release]; 
  [super dealloc];
}

- (id)init {
  if ( (self = [super init]) ) {
    self.backgroundColor = [UIColor blackColor];
    label1_ = [[UILabel alloc] initWithFrame:CGRectZero];
    label1_.text = @"ABC";
    [label1_ sizeToFit];
    label2_ = [[UILabel alloc] initWithFrame:CGRectZero];
    label2_.text = @"ABCDEFGHIJKLMN";
    [label2_ sizeToFit];
    CGPoint newPoint = label2_.center;
    newPoint.x += 100;
    newPoint.y += 50;
    label2_.center = newPoint;
    [self addSubview:label1_];
    [self addSubview:label2_];
  }
  return self;
}

- (CGSize)sizeThatFits:(CGSize)size {
  CGFloat x1, x2, y1, y2;

  // label1_과 label2_중에서 왼쪽으로 뻗어있는 쪽의 왼쪽 끝단 좌표를 x1으로 설정한다
  if ( label1_.frame.origin.x < label2_.frame.origin.x ) {
    x1 = label1_.frame.origin.x;
  }  else {
    x1 = label2_.frame.origin.x;
  }

  // label1_과 label2_중에서 오른쪽으로 뻗어있는 쪽의 오른쪽 끝단 좌표를 x2로 설정한다
  if ( label1_.frame.origin.x + label1_.frame.size.width >
        label2_.frame.origin.x + label2_.frame.size.width )
  {
    x2 = label1_.frame.origin.x + label1_.frame.size.width;
  }  else {
    x2 = label2_.frame.origin.x + label2_.frame.size.width;
  }

  // label1_과 label2_중에서 위로 뻗어있는 쪽의 왼쪽 끝단 좌표를 y1으로 설정한다
  if ( label1_.frame.origin.y < label2_.frame.origin.y ) {
    y1 = label1_.frame.origin.y;
  }  else {
    y1 = label2_.frame.origin.y;
  }

  // label1_과 label2_중에서 아래로 뻗어있는 쪽의 오른쪽 끝단 좌표를 y2로 설정한다
  if ( label1_.frame.origin.y + label1_.frame.size.height >
        label2_.frame.origin.y + label2_.frame.size.height )
  {
    y2 = label1_.frame.origin.y + label1_.frame.size.height;
  }  else {
    y2 = label2_.frame.origin.y + label2_.frame.size.height;
  }

  // 새로운 크기 설정
  size.width = x2 - x1;
  size.height = y2 - y1;
  return size;
}

@end

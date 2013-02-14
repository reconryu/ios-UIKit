//
//  SampleForLayoutSubviews.m
//
//  Created by ToKoRo on 2009-08-13.
//

#import "SampleForLayoutSubviews.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForLayoutSubviews ()
- (void)setNeedsDidPush;
- (void)resizeDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForLayoutSubviews

// finalize
- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor grayColor];

  label_ = [[LayoutTest alloc] init];

  [self.view addSubview:label_];

  // setNeedsLayout버튼을 추가
  UIButton* setNeedsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  setNeedsButton.frame = CGRectMake( 0, 0, 150, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 75;
  newPoint.y = self.view.frame.size.height - 40;
  setNeedsButton.center = newPoint;
  [setNeedsButton setTitle:@"setNeedsLayout" forState:UIControlStateNormal];
  [setNeedsButton addTarget:self
                     action:@selector(setNeedsDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:setNeedsButton];

  // layoutIfNeeded버튼을 추가
  UIButton* layoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  layoutButton.frame = CGRectMake( 0, 0, 150, 40 );
  newPoint.x += 150;
  layoutButton.center = newPoint;
  [layoutButton setTitle:@"layoutIfNeeded" forState:UIControlStateNormal];
  [layoutButton addTarget:self
                     action:@selector(resizeDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:layoutButton];
}

#pragma mark ----- Private Methods -----

- (void)setNeedsDidPush {
  // child1_을 취득해서 크기를 변경
  UIView* child1 = (UIView*)[label_.subviews objectAtIndex:0];
  child1.frame = CGRectMake( 0, 0, 160, 160 );
  child1.center = label_.center;
}

- (void)resizeDidPush {
  [label_ setNeedsLayout];
  [label_ layoutIfNeeded];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

#pragma mark ----- Implementation For LayoutTest -----

@implementation LayoutTest

// finalize
- (void)dealloc {
  [child1_ release]; 
  [child2_ release]; 
  [super dealloc];
}

// initialize
- (id)init {
  if ( (self = [super init]) ) {
    self.frame = CGRectMake( 0, 0, 320, 320 );
    child1_ = [[UILabel alloc] initWithFrame:CGRectZero]; 
    child1_.text = @"CHILD 1";
    [child1_ sizeToFit];
    child1_.backgroundColor = [UIColor redColor];
    child1_.textColor = [UIColor whiteColor];
    child2_ = [[UILabel alloc] initWithFrame:CGRectZero]; 
    child2_.text = @"CHILD 2";
    [child2_ sizeToFit];
    child2_.backgroundColor = [UIColor blueColor];
    child2_.textColor = [UIColor whiteColor];
    child2_.center = CGPointMake( child2_.center.x, child2_.center.y + 30 );
    [self addSubview:child1_];
    [self addSubview:child2_];
  }
  return self;
}

- (void)layoutSubviews {
  // 부모 클래스의 같은 메소드를 호출
  [super layoutSubviews];

  // 자식 요소를 다시 레이아웃
  
  // child1_을 왼쪽 아래로
  CGRect newRect = child1_.frame;
  newRect.origin.x = 0;
  newRect.origin.y = self.frame.size.height - child1_.frame.size.height;
  child1_.frame = newRect;

  // child2_을 오른쪽 위로
  newRect = child2_.frame;
  newRect.origin.x = self.frame.size.width - child2_.frame.size.width;
  newRect.origin.y = 0;
  child2_.frame = newRect;
}

@end 

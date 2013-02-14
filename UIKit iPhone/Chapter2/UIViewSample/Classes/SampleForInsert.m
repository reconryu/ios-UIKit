//
//  SampleForInsert.m
//
//  Created by ToKoRo on 2009-08-09.
//

#import "SampleForInsert.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForInsert ()
- (void)subviewsDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForInsert

// finalize
- (void)dealloc {
  [parent_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 배경을 검정색으로 설정
  self.view.backgroundColor = [UIColor blackColor];

  // 부모가 되는 라벨을 설정
  parent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 320 )];
  parent_.textAlignment = UITextAlignmentCenter;
  parent_.text = @"PARENT";
  [self.view addSubview:parent_];

  // 자식 요소가 되는 라벨을 1개 추가
  UILabel* child3 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child3.text = @"CHILD 3";
  [child3 sizeToFit];
  [parent_ insertSubview:child3 atIndex:0];

  // 방금 추가한 CHILD 3 아래에 CHILD 1 을 삽입
  UILabel* child1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child1.text = @"CHILD 1";
  [child1 sizeToFit];
  [parent_ insertSubview:child1 belowSubview:child3];

  // 방금 추가한 CHILD 1 위에 CHILD 2 를 추가
  UILabel* child2 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  child2.text = @"CHILD 2";
  [child2 sizeToFit];
  [parent_ insertSubview:child2 aboveSubview:child1];

  // CHILD 1 과 CHILD 3 을 교환
  [parent_ exchangeSubviewAtIndex:0 withSubviewAtIndex:2];

  // CHILD 3 이 PARENT 의 자식 요소이면
  if ( [child3 isDescendantOfView:parent_] ) {
    // CHILD 3 을 삭제
    [child3 removeFromSuperview];
  } 


  // subviews 참조 버튼을 추가
  UIButton* subviewsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  subviewsButton.frame = CGRectMake( 0, 0, 150, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.y = self.view.frame.size.height - 40;
  subviewsButton.center = newPoint;
  [subviewsButton setTitle:@"subviews표시" forState:UIControlStateNormal];
  [subviewsButton addTarget:self
                     action:@selector(subviewsDidPush)
           forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:subviewsButton];
}

#pragma mark ----- Private Methods -----

- (void)subviewsDidPush {

  NSMutableString* subviews = [[[NSMutableString alloc] initWithCapacity:64] autorelease];
  [subviews setString:@""];

  // subviews의 text를 연결해 나간다
  for ( id view in parent_.subviews ) {
    NSString* addString;
    if ( [view isKindOfClass:[UILabel class]] ) {
      addString = ((UILabel*)view).text;
    } else {
      addString = [view description];
    }
    if ( [subviews length] > 0 ) {
      [subviews appendString:@", "];
    }
    [subviews appendString:addString];
  }

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"subviews"
                                                   message:subviews
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

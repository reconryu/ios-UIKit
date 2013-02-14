//
//  SampleForConvertPoint.m
//
//  Created by ToKoRo on 2009-08-12.
//

#import "SampleForConvertPoint.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForConvertPoint ()
- (void)toViewDidPush;
- (void)fromViewDidPush;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForConvertPoint

// finalize
- (void)dealloc {
  [parent_ release];
  [child1_ release];
  [child2_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];

  // 배경을 검정색으로 설정
  self.view.backgroundColor = [UIColor blackColor];

  // 부모가 되는 라벨을 추가
  parent_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 320 )];
  parent_.textAlignment = UITextAlignmentCenter;
  [self.view addSubview:parent_];

  // 자식 요소가 되는 라벨을 2개 추가
  child1_ = [[UILabel alloc] initWithFrame:CGRectMake( 10, 10, 100, 100 )];
  child1_.text = @"CHILD 1";
  child1_.textAlignment = UITextAlignmentCenter;
  child1_.backgroundColor = [UIColor blackColor];
  child1_.textColor = [UIColor whiteColor];
  child2_ = [[UILabel alloc] initWithFrame:CGRectMake( 110, 110, 100, 100 )];
  child2_.text = @"CHILD 2";
  child2_.textAlignment = UITextAlignmentCenter;
  child2_.backgroundColor = [UIColor blackColor];
  child2_.textColor = [UIColor whiteColor];
  [parent_ addSubview:child1_];
  [parent_ addSubview:child2_];

  // toView 버튼을 추가
  UIButton* toViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  toViewButton.frame = CGRectMake( 0, 0, 100, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 40;
  toViewButton.center = newPoint;
  [toViewButton setTitle:@"toView" forState:UIControlStateNormal];
  [toViewButton addTarget:self
                   action:@selector(toViewDidPush)
         forControlEvents:UIControlEventTouchUpInside];
  // fromView 버튼을 추가
  UIButton* fromViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  fromViewButton.frame = CGRectMake( 0, 0, 100, 40 );
  newPoint.x += 100;
  fromViewButton.center = newPoint;
  [fromViewButton setTitle:@"fromView" forState:UIControlStateNormal];
  [fromViewButton addTarget:self
                   action:@selector(fromViewDidPush)
         forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:toViewButton];
  [self.view addSubview:fromViewButton];
}

#pragma mark ----- Private Methods -----

- (void)toViewDidPush {

  CGPoint newPoint = [child1_ convertPoint:CGPointMake( 100, 100 ) toView:child2_];
  CGRect newFrame = [child1_ convertRect:CGRectMake( 0, 0, 100, 100 ) toView:child2_];
  NSString* title = [NSString stringWithFormat:@"( %f, %f )", newPoint.x, newPoint.y];
  NSString* message = [NSString stringWithFormat:@"( %f, %f, %f, %f )",
                                  newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height];

  UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:title
                                                   message:message
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                         otherButtonTitles:@"OK", nil ] autorelease];

  [alert show];
}

- (void)fromViewDidPush {

  CGPoint newPoint = [child1_ convertPoint:CGPointMake( 0, 0 ) fromView:child2_];
  CGRect newFrame = [child1_ convertRect:CGRectMake( 0, 0, 100, 100 ) fromView:child2_];
  NSString* title = [NSString stringWithFormat:@"( %f, %f )", newPoint.x, newPoint.y];
  NSString* message = [NSString stringWithFormat:@"( %f, %f, %f, %f )",
                                  newFrame.origin.x, newFrame.origin.y, newFrame.size.width, newFrame.size.height];

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

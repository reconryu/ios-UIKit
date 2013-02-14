//
//  SampleForFrame.m
//
//  Created by ToKoRo on 2009-08-05.
//

#import "SampleForFrame.h"

@implementation SampleForFrame

#pragma mark ----- Override Methods -----

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  UILabel* label1 = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  label1.text = @"거의 오른쪽 위";

  // label1의 frame을 임의의 것으로 변경 
  CGRect newFrame = CGRectMake( 220, 20, 100, 50 );
  label1.frame = newFrame;

  UILabel* label2 = [[[UILabel alloc] initWithFrame:[label1 frame]] autorelease];
  label2.textAlignment = UITextAlignmentCenter;
  label2.text = @"세계의 중심";

  // label2의 center를 정중앙이 되도록 조정
  CGPoint newPoint = self.view.center;
  // 상태바만 위로 조금 옮긴다
  newPoint.y -= 20;
  label2.center = newPoint;

  // label1 과 label2 를 화면에 추가한다
  [self.view addSubview:label1];
  [self.view addSubview:label2];

  /* sample
  UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
  // frame설정
  label.frame = CGRectMake( 0, 0, 200, 50 );
  // center설정
  label.center = CGPointMake( 160, 240 );
  // frame참조
  NSLog( @"x = %f", label.frame.origin.x );
  NSLog( @"y = %f", label.frame.origin.y );
  NSLog( @"width = %f", label.frame.size.width );
  NSLog( @"height = %f", label.frame.size.height );
  // center참조
  NSLog( @"x = %f", label.center.x );
  NSLog( @"y = %f", label.center.y );
  */
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

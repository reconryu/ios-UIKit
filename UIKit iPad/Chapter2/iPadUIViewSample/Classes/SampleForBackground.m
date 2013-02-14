//
//  SampleForBackground.m
//
//  Created by ToKoRo on 2009-08-07.
//

#import "SampleForBackground.h"

#pragma mark ----- Private Methods Definition -----

@interface SampleForBackground ()
- (void)redDidPush;
- (void)greenDidPush;
- (void)blueDidPush;
- (void)changeLabelColor:(CGFloat*)pColor;
@end 

#pragma mark ----- Start Implementation For Methods -----

@implementation SampleForBackground

// finalize
- (void)dealloc {
  [label_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor blackColor];

  // 화면 상부에 라벨을 추가
  label_ = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
  label_.textAlignment = UITextAlignmentCenter;
  redColor_ = 0.0;
  greenColor_ = 0.0;
  blueColor_ = 0.0;
  label_.backgroundColor = [[[UIColor alloc] initWithRed:redColor_
                                                   green:greenColor_
                                                    blue:blueColor_
                                                   alpha:1.0] autorelease];
  label_.textColor = [UIColor whiteColor];
  label_.text = @"당신 색으로 물들여주세요・・・";

  [self.view addSubview:label_];

  // 빨간 버튼을 추가
  UIButton* redButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  redButton.frame = CGRectMake( 0, 0, 50, 40 );
  CGPoint newPoint = self.view.center;
  newPoint.x -= 50;
  newPoint.y = self.view.frame.size.height - 70;
  redButton.center = newPoint;
  [redButton setTitle:@"빨강" forState:UIControlStateNormal];
  [redButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
  [redButton addTarget:self
                action:@selector(redDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 녹색 버튼을 추가
  UIButton* greenButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  greenButton.frame = redButton.frame;
  newPoint.x += 50;
  greenButton.center = newPoint;
  [greenButton setTitle:@"녹색" forState:UIControlStateNormal];
  [greenButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
  [greenButton addTarget:self
                action:@selector(greenDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  // 청색 버튼을 추가
  UIButton* blueButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  blueButton.frame = redButton.frame;
  newPoint.x += 50;
  blueButton.center = newPoint;
  [blueButton setTitle:@"파랑" forState:UIControlStateNormal];
  [blueButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  [blueButton addTarget:self
                action:@selector(blueDidPush)
      forControlEvents:UIControlEventTouchUpInside];

  [self.view addSubview:redButton];
  [self.view addSubview:greenButton];
  [self.view addSubview:blueButton];
}

#pragma mark ----- Private Methods -----

- (void)redDidPush {
  [self changeLabelColor:&redColor_];
}

- (void)greenDidPush {
  [self changeLabelColor:&greenColor_];
}

- (void)blueDidPush {
  [self changeLabelColor:&blueColor_];
}

- (void)changeLabelColor:(CGFloat*)pColor {
  if ( !pColor ) return;

  // 지정색을 0.1씩 늘린다
  // 이미 1.0이라면 0.0으로 되돌린다
  if ( *pColor > 0.99 ) {
    *pColor = 0.0;
  } else {
    *pColor += 0.1;
  }
  // 라벨 색의 갱신
  label_.backgroundColor = [[[UIColor alloc] initWithRed:redColor_
                                                   green:greenColor_
                                                    blue:blueColor_
                                                   alpha:1.0] autorelease];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

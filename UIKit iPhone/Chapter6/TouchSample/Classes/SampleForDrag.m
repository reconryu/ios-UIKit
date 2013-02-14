//
//  SampleForDrag.m
//
//  Created by ToKoRo on 2009-09-01.
//

#import "SampleForDrag.h"

#pragma mark ----- Private Methods Definition -----

// private 메소드의 정의
@interface SampleForDrag ()
//- (UIImage*)imageWithFilename:(NSString*)fileName;
- (void)theCharacterWillWalk;
@end 

#pragma mark ----- Start Implementation For Methods -----

// 클래스 구현부분
@implementation SampleForDrag

- (void)dealloc {
  shouldWalk_ = NO;
  [character_ release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  // 애니메이션을 하기위해 화면 두개를 읽는다.
  // imageWithFilename:은 이번에 사용하는 private메소드이다.
  UIImage* image1 = [UIImage imageNamed:@"chara1.png"];
  UIImage* image2 = [UIImage imageNamed:@"chara2.png"];
  NSArray* images = [[NSArray alloc] initWithObjects:image1, image2, nil];
  // UIImageView를 작성 & 초기화
  character_ = [[UIImageView alloc] initWithImage:image1];
  // 애니메이션용 이미지를 NSArray에 설정
  character_.animationImages = images;
  // 애니메이션용 스피드를 최적인 수치를 설정
  character_.animationDuration = 0.3;
  [images release];
  [self.view addSubview:character_];
}

// 화면이 숨는 만약을 대비해서 shouldWalk_를 NO로 설정한다
- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  shouldWalk_ = NO;
}

#pragma mark ----- Responder -----

// 화면에 손가락이 닿는 순간부터 애니메이션을 시작해서 캐릭터 이동용 메소드를 호출
// 캐릭터 이동용 메소드는 shouldWalk_가 YES인 한 계속 호출된다.
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = YES;
  [character_ startAnimating];
  targetPoint_ = [[touches anyObject] locationInView:self.view];
  [self theCharacterWillWalk];
}

// 화면을 드래그한 경우 그 위치를 저장
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
  targetPoint_ = [[touches anyObject] locationInView:self.view];
}

// 화면으로부터 손가락이 떨어지면 애니메이션을 정지하고, shouldWalk_도 NO로 설정
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = NO;
  [character_ stopAnimating];
}

// 터치 상태가 취소되면 애니메이션을 정지하고, shouldWalk_도 NO로 설정
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event {
  shouldWalk_ = NO;
  [character_ stopAnimating];
}

#pragma mark ----- Private Methods -----

// 손가락이 닿고 있는 위치에 캐릭터의 위치를 조금씩 이동하는 메소드
// shouldWalk_가YES라면、0.3초 지연을 시키고 재귀적으로 호출한다
- (void)theCharacterWillWalk {
  if ( !shouldWalk_ ) {
    return;
  } 
  
  // 한 번에 이동 가능한 거리를 8픽셀로 한다
  static const NSInteger kMaximumSteps = 8;
  CGPoint newPoint = character_.center;
  if ( kMaximumSteps < abs( targetPoint_.x - newPoint.x  ) ) {
    if ( targetPoint_.x > newPoint.x ) {
      newPoint.x += kMaximumSteps;
    } else {
      newPoint.x -= kMaximumSteps;
    }
  } else {
    newPoint.x = targetPoint_.x;
  }
  if ( kMaximumSteps < abs( targetPoint_.y - newPoint.y  ) ) {
    if ( targetPoint_.y > newPoint.y ) {
      newPoint.y += kMaximumSteps;
    } else {
      newPoint.y -= kMaximumSteps;
    }
  } else {
    newPoint.y = targetPoint_.y;
  }

  character_.center = newPoint;
  
  // 이곳이 이 메소드를 재귀적으로 호출하는 부분
  [self performSelector:@selector(theCharacterWillWalk)
             withObject:nil
             afterDelay:0.3];
}

@end
